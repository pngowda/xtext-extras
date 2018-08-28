package org.eclipse.xtext.java.resource;

import java.io.InputStream;
import java.util.function.Function;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.jdt.internal.compiler.batch.CompilationUnit;
import org.eclipse.jdt.internal.compiler.classfmt.ClassFileReader;
import org.eclipse.jdt.internal.compiler.env.INameEnvironment;
import org.eclipse.jdt.internal.compiler.env.NameEnvironmentAnswer;
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor;
import org.eclipse.xtext.common.types.TypesPackage;
import org.eclipse.xtext.common.types.descriptions.EObjectDescriptionBasedStubGenerator;
import org.eclipse.xtext.java.resource.ClassFileCache;
import org.eclipse.xtext.java.resource.JavaResource;
import org.eclipse.xtext.naming.QualifiedName;
import org.eclipse.xtext.resource.IEObjectDescription;
import org.eclipse.xtext.resource.IResourceDescription;
import org.eclipse.xtext.resource.IResourceDescriptions;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@FinalFieldsConstructor
@SuppressWarnings("all")
public class IndexAwareNameEnvironment implements INameEnvironment {
  private final Resource resource;
  
  private final ClassLoader classLoader;
  
  private final IResourceDescriptions resourceDescriptions;
  
  private final EObjectDescriptionBasedStubGenerator stubGenerator;
  
  private final ClassFileCache classFileCache;
  
  @Override
  public void cleanup() {
  }
  
  @Override
  public NameEnvironmentAnswer findType(final char[][] compoundTypeName) {
    final int len = compoundTypeName.length;
    if ((len == 1)) {
      return this.findType(QualifiedName.create(String.valueOf(compoundTypeName[0])));
    }
    final QualifiedName.Builder qnBuilder = new QualifiedName.Builder(len);
    for (final char[] segment : compoundTypeName) {
      qnBuilder.add(String.valueOf(segment));
    }
    return this.findType(qnBuilder.build());
  }
  
  public NameEnvironmentAnswer findType(final QualifiedName className) {
    final Function<QualifiedName, Object> _function = (QualifiedName it) -> {
      try {
        final IEObjectDescription candidate = IterableExtensions.<IEObjectDescription>head(this.resourceDescriptions.getExportedObjects(TypesPackage.Literals.JVM_DECLARED_TYPE, className, false));
        if ((candidate != null)) {
          final URI resourceURI = candidate.getEObjectURI().trimFragment();
          final Resource res = this.resource.getResourceSet().getResource(resourceURI, false);
          char[] _xifexpression = null;
          if ((res instanceof JavaResource)) {
            _xifexpression = ((JavaResource) res).getOriginalSource();
          } else {
            char[] _xblockexpression = null;
            {
              final IResourceDescription resourceDescription = this.resourceDescriptions.getResourceDescription(resourceURI);
              _xblockexpression = this.stubGenerator.getJavaStubSource(candidate, resourceDescription).toCharArray();
            }
            _xifexpression = _xblockexpression;
          }
          final char[] source = _xifexpression;
          String _string = className.toString("/");
          String _plus = (_string + ".java");
          return new CompilationUnit(source, _plus, null);
        } else {
          String _string_1 = className.toString("/");
          final String fileName = (_string_1 + ".class");
          final InputStream stream = this.classLoader.getResourceAsStream(fileName);
          if ((stream == null)) {
            return null;
          }
          try {
            return ClassFileReader.read(stream, fileName);
          } finally {
            stream.close();
          }
        }
      } catch (Throwable _e) {
        throw Exceptions.sneakyThrow(_e);
      }
    };
    return this.classFileCache.computeIfAbsent(className, _function);
  }
  
  @Override
  public NameEnvironmentAnswer findType(final char[] typeName, final char[][] packageName) {
    int _length = packageName.length;
    boolean _tripleEquals = (_length == 0);
    if (_tripleEquals) {
      return this.findType(QualifiedName.create(String.valueOf(typeName)));
    }
    int _length_1 = packageName.length;
    int _plus = (_length_1 + 1);
    final QualifiedName.Builder qnBuilder = new QualifiedName.Builder(_plus);
    for (final char[] packageSegment : packageName) {
      qnBuilder.add(String.valueOf(packageSegment));
    }
    qnBuilder.add(String.valueOf(typeName));
    return this.findType(qnBuilder.build());
  }
  
  @Override
  public boolean isPackage(final char[][] parentPackageName, final char[] packageName) {
    if (((packageName == null) || (packageName.length == 0))) {
      return false;
    }
    return Character.isLowerCase((IterableExtensions.<Character>head(((Iterable<Character>)Conversions.doWrapArray(packageName)))).charValue());
  }
  
  public IndexAwareNameEnvironment(final Resource resource, final ClassLoader classLoader, final IResourceDescriptions resourceDescriptions, final EObjectDescriptionBasedStubGenerator stubGenerator, final ClassFileCache classFileCache) {
    super();
    this.resource = resource;
    this.classLoader = classLoader;
    this.resourceDescriptions = resourceDescriptions;
    this.stubGenerator = stubGenerator;
    this.classFileCache = classFileCache;
  }
}
