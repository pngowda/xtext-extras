package org.eclipse.xtext.java.resource

import java.util.List
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.jdt.internal.compiler.batch.CompilationUnit
import org.eclipse.jdt.internal.compiler.classfmt.ClassFileReader
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
	
	override cleanup() {
	}

	override findType(char[][] compoundTypeName) {
		val className = QualifiedName.create(compoundTypeName.map[String.valueOf(it)])
		return findType(className)
	}
	
	def NameEnvironmentAnswer findType(QualifiedName className) {
		return classFileCache.computeIfAbsent(className) [
			val candidate = resourceDescriptions.getExportedObjects(TypesPackage.Literals.JVM_DECLARED_TYPE, className, false).head
			if (candidate !== null) {
				val resourceURI = candidate.EObjectURI.trimFragment
				val res = resource.resourceSet.getResource(resourceURI, false)
				val source = if (res instanceof JavaResource) {
				    (res as JavaResource).originalSource
				} else {
					val resourceDescription = resourceDescriptions.getResourceDescription(resourceURI)
				    stubGenerator.getJavaStubSource(candidate, resourceDescription).toCharArray
				}
				return new CompilationUnit(source, className.toString('/')+'.java', null)
			} else {
				val fileName = className.toString('/') + ".class"
				val stream = classLoader.getResourceAsStream(fileName)
				if (stream === null) {
					return null;
				}
				try {
					return ClassFileReader.read(stream, fileName)
				} finally {
					stream.close
				}
			}
		]
	}

	override findType(char[] typeName, char[][] packageName) {
		val List<String> segments = newArrayList
		for(char[] packageSegment: packageName) {
			segments.add(String.valueOf(packageSegment))
		}
		segments.add(String.valueOf(typeName))
		val className = QualifiedName.create(segments)
		return findType(className)
	}

	override isPackage(char[][] parentPackageName, char[] packageName) {
		if (packageName === null || packageName.length == 0) {
			return false;
		}
		// Mostly working hack
		return Character.isLowerCase(packageName.head)
	}
}	
 