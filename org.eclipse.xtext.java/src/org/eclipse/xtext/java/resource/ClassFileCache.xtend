/*******************************************************************************
 * Copyright (c) 2018 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.java.resource

import java.util.Map
import java.util.concurrent.ConcurrentHashMap
import java.util.function.Function
import org.eclipse.jdt.internal.compiler.env.IBinaryType
import org.eclipse.xtext.naming.QualifiedName
import org.eclipse.xtext.util.internal.EmfAdaptable
import org.eclipse.jdt.internal.compiler.env.NameEnvironmentAnswer
import org.eclipse.jdt.internal.compiler.env.ICompilationUnit

/**
 * @author Christian Dietrich - Initial contribution and API
 * @since 2.15
 */
@EmfAdaptable
class ClassFileCache {
	
	static val NULL = new Object();
	
	val Map<QualifiedName, Object> cache = new ConcurrentHashMap()
	 
	def NameEnvironmentAnswer computeIfAbsent(QualifiedName qualifiedName, Function<? super QualifiedName, ? extends Object> compiler) {
		/*
		 * Implementation note:
		 * 
		 * We do intentionally not use #computeIfAbsent since that would be a synchronized call per qualifiedName.
		 * When building, we process resources partially in parallel and the synchronization may cause unnecessary
		 * contention. It is perfectly ok, if for some qualifiedName the Java compiler is used more than once though.
		 */
		var binaryTypeOrCompilationUnit = cache.get(qualifiedName);
		if (binaryTypeOrCompilationUnit === null) {
			binaryTypeOrCompilationUnit = compiler.apply(qualifiedName) ?: NULL
			cache.put(qualifiedName, binaryTypeOrCompilationUnit)
		}
		if (binaryTypeOrCompilationUnit instanceof IBinaryType) {
			return new NameEnvironmentAnswer(binaryTypeOrCompilationUnit, null)	
		}
		if (binaryTypeOrCompilationUnit instanceof ICompilationUnit) {
			return new NameEnvironmentAnswer(binaryTypeOrCompilationUnit, null)
		}
		return null
	}
	
}