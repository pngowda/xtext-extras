package org.eclipse.xtext.java.resource

import java.io.InputStream
import java.util.ArrayList
import java.util.Map
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.jdt.internal.compiler.batch.CompilationUnit
import org.eclipse.jdt.internal.compiler.classfmt.ClassFileReader
import org.eclipse.jdt.internal.compiler.env.IBinaryType
import org.eclipse.jdt.internal.compiler.env.INameEnvironment
import org.eclipse.jdt.internal.compiler.env.NameEnvironmentAnswer
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor
import org.eclipse.xtext.common.types.TypesPackage
import org.eclipse.xtext.common.types.descriptions.EObjectDescriptionBasedStubGenerator
import org.eclipse.xtext.naming.QualifiedName
import org.eclipse.xtext.resource.IResourceDescriptions

@FinalFieldsConstructor class IndexAwareNameEnvironment implements INameEnvironment {

    val Resource resource
	val ClassLoader classLoader
	val IResourceDescriptions resourceDescriptions
	val EObjectDescriptionBasedStubGenerator stubGenerator
	val ClassFileCache classFileCache
	
	Map<QualifiedName, NameEnvironmentAnswer> nameToAnswerCache = newHashMap()

	override cleanup() {
		nameToAnswerCache.clear
		classFileCache.clear
	}

	override findType(char[][] compoundTypeName) {
		val len = compoundTypeName.length
		if (len === 1) {
			return findType(QualifiedName.create(String.valueOf(compoundTypeName.get(0))));
		}
		val qnBuilder = new QualifiedName.Builder(len)
		for(char[] segment: compoundTypeName) {
			qnBuilder.add(String.valueOf(segment))
		}
		return findType(qnBuilder.build)
	}
	
	def NameEnvironmentAnswer findType(QualifiedName className) {
		if (classFileCache.containsKey(className)) {
			val t = classFileCache.get(className)
			// TODO is this ok?
			if (t===null) {
				return null
			}
			return new NameEnvironmentAnswer(t, null)
		}
		if (nameToAnswerCache.containsKey(className)) {
			return nameToAnswerCache.get(className)
		}
		val candidate = resourceDescriptions.getExportedObjects(TypesPackage.Literals.JVM_DECLARED_TYPE, className, false).head
		var NameEnvironmentAnswer result = null 
		if (candidate !== null) {
			val resourceURI = candidate.EObjectURI.trimFragment
			val res = resource.resourceSet.getResource(resourceURI, false)
			val source = if (res instanceof JavaResource) {
			    (res as JavaResource).originalSource
			} else {
				val resourceDescription = resourceDescriptions.getResourceDescription(resourceURI)
			    stubGenerator.getJavaStubSource(candidate, resourceDescription).toCharArray
			}
			result = new NameEnvironmentAnswer(new CompilationUnit(source, className.toString('/')+'.java', null), null)
		} else {
			val fileName = className.toString('/') + ".class"
			val stream = classLoader.getResourceAsStream(fileName)
			if (stream === null) {
				nameToAnswerCache.put(className, null)
				//TODO is that ok
				classFileCache.put(className, null)
				return null;
			}
			// todo: try with resources/ close Stream
			val IBinaryType reader = try {
				ClassFileReader.read(stream, fileName)
				//TODO what if read fails
			} finally {
				if (stream !== null) {
					stream.close
				}
			}
			// TODO is this ok?
			// TODO what if reader is null
			if (reader === null) {
				return null;
			}
			classFileCache.put(className, reader)
			result = new NameEnvironmentAnswer(reader, null)
		}
		nameToAnswerCache.put(className, result)
		return result
	}

	override findType(char[] typeName, char[][] packageName) {
		if (packageName.length === 0) {
			return findType(QualifiedName.create(String.valueOf(typeName)))
		}
		val qnBuilder = new QualifiedName.Builder(packageName.length + 1)
		for(char[] packageSegment: packageName) {
			qnBuilder.add(String.valueOf(packageSegment))
		}
		qnBuilder.add(String.valueOf(typeName))
		return findType(qnBuilder.build)
	}

	override isPackage(char[][] parentPackageName, char[] packageName) {
		if (packageName === null || packageName.length == 0) {
			return false;
		}
		// Mostly working hack
		return Character.isLowerCase(packageName.head)
	}
}	
 