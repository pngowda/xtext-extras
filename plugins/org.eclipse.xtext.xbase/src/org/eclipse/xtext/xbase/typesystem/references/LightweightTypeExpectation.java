/*******************************************************************************
 * Copyright (c) 2012 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.xbase.typesystem.references;

import org.eclipse.jdt.annotation.NonNullByDefault;
import org.eclipse.jdt.annotation.Nullable;
import org.eclipse.xtext.common.types.JvmTypeParameter;
import org.eclipse.xtext.xbase.XExpression;
import org.eclipse.xtext.xbase.typesystem.computation.ITypeExpectation;
import org.eclipse.xtext.xbase.typesystem.conformance.ConformanceHint;

/**
 * @author Sebastian Zarnekow - Initial contribution and API
 */
@NonNullByDefault
public interface LightweightTypeExpectation extends ITypeExpectation {

	@Nullable
	LightweightTypeReference internalGetExpectedType();

	void acceptActualType(LightweightTypeReference type, ConformanceHint... hint);

	OwnedConverter getConverter();
	
	TypeReferenceOwner getReferenceOwner();
	
	UnboundTypeReference createUnboundTypeReference(XExpression expression, JvmTypeParameter typeParameter);
	
	LightweightTypeExpectation copyInto(TypeReferenceOwner referenceOwner);
	
	boolean isOwnedBy(TypeReferenceOwner referenceOwner);
	
}