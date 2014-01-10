/*******************************************************************************
 * Copyright (c) 2014 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.xbase.interpreter

/**
 * @author Sven Efftinge - Initial contribution and API
 */
class ConstantOperators {
	
	def dispatch minus(Object operand) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '-' for operand "+operand);
	}
	def dispatch minus(Integer e) { -e } 
	def dispatch minus(Double e) { -e } 
	def dispatch minus(Long e) { -e } 
	def dispatch minus(Short e) { -e } 
	def dispatch minus(Float e) { -e } 
	def dispatch minus(Byte e) { -e } 
	
	def dispatch plus(String left, Object right) {
		left + right
	}
	
	def static void main(String[] args) {
		val types = #{'Integer'->'intValue()','Short'->'shortValue()','Long'->'longValue()','Float'->'floatValue()','Double'->'doubleValue()','Byte'->'byteValue()'}
		val operators = #{
			'plus'->'+','minus'->'-','divide'->'/','multiply'->'*','modulo'->'%',
			'lessThan'->'<','greaterThan'->'>','lessEquals'->'<=','greaterEquals'->'>=',
			'same'->'===', 'notSame'->'!=='				
		}
		val booleanOps = #{'<','<=','>','>=','===','!=='}
		for (op : operators.entrySet) {
			val returnType = if (booleanOps.contains(op.value)) 'boolean ' else ''
			println('''
				
				def dispatch �returnType��op.key�(Object left, Object right) {
					throw new ConstantExpressionEvaluationException("Unsupported operator '�op.value�' for operands "+left+" and "+right);
				}
			''')
			for (left : types.keySet) {
				println("")			
				for (right : types.keySet) {
					println('''def dispatch �returnType��op.key�(�left� left, �right� right) { left.�types.get(left)� �op.value� right.�types.get(right)� }''')
				}
			}
		}
	}
	// generated from output of main (see above)

	def dispatch plus(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '+' for operands "+left+" and "+right);
	}
	
	
	def dispatch plus(Byte left, Byte right) { left.byteValue() + right.byteValue() }
	def dispatch plus(Byte left, Double right) { left.byteValue() + right.doubleValue() }
	def dispatch plus(Byte left, Float right) { left.byteValue() + right.floatValue() }
	def dispatch plus(Byte left, Long right) { left.byteValue() + right.longValue() }
	def dispatch plus(Byte left, Short right) { left.byteValue() + right.shortValue() }
	def dispatch plus(Byte left, Integer right) { left.byteValue() + right.intValue() }
	
	def dispatch plus(Double left, Byte right) { left.doubleValue() + right.byteValue() }
	def dispatch plus(Double left, Double right) { left.doubleValue() + right.doubleValue() }
	def dispatch plus(Double left, Float right) { left.doubleValue() + right.floatValue() }
	def dispatch plus(Double left, Long right) { left.doubleValue() + right.longValue() }
	def dispatch plus(Double left, Short right) { left.doubleValue() + right.shortValue() }
	def dispatch plus(Double left, Integer right) { left.doubleValue() + right.intValue() }
	
	def dispatch plus(Float left, Byte right) { left.floatValue() + right.byteValue() }
	def dispatch plus(Float left, Double right) { left.floatValue() + right.doubleValue() }
	def dispatch plus(Float left, Float right) { left.floatValue() + right.floatValue() }
	def dispatch plus(Float left, Long right) { left.floatValue() + right.longValue() }
	def dispatch plus(Float left, Short right) { left.floatValue() + right.shortValue() }
	def dispatch plus(Float left, Integer right) { left.floatValue() + right.intValue() }
	
	def dispatch plus(Long left, Byte right) { left.longValue() + right.byteValue() }
	def dispatch plus(Long left, Double right) { left.longValue() + right.doubleValue() }
	def dispatch plus(Long left, Float right) { left.longValue() + right.floatValue() }
	def dispatch plus(Long left, Long right) { left.longValue() + right.longValue() }
	def dispatch plus(Long left, Short right) { left.longValue() + right.shortValue() }
	def dispatch plus(Long left, Integer right) { left.longValue() + right.intValue() }
	
	def dispatch plus(Short left, Byte right) { left.shortValue() + right.byteValue() }
	def dispatch plus(Short left, Double right) { left.shortValue() + right.doubleValue() }
	def dispatch plus(Short left, Float right) { left.shortValue() + right.floatValue() }
	def dispatch plus(Short left, Long right) { left.shortValue() + right.longValue() }
	def dispatch plus(Short left, Short right) { left.shortValue() + right.shortValue() }
	def dispatch plus(Short left, Integer right) { left.shortValue() + right.intValue() }
	
	def dispatch plus(Integer left, Byte right) { left.intValue() + right.byteValue() }
	def dispatch plus(Integer left, Double right) { left.intValue() + right.doubleValue() }
	def dispatch plus(Integer left, Float right) { left.intValue() + right.floatValue() }
	def dispatch plus(Integer left, Long right) { left.intValue() + right.longValue() }
	def dispatch plus(Integer left, Short right) { left.intValue() + right.shortValue() }
	def dispatch plus(Integer left, Integer right) { left.intValue() + right.intValue() }
	
	def dispatch boolean lessThan(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '<' for operands "+left+" and "+right);
	}
	
	
	def dispatch boolean lessThan(Byte left, Byte right) { left.byteValue() < right.byteValue() }
	def dispatch boolean lessThan(Byte left, Double right) { left.byteValue() < right.doubleValue() }
	def dispatch boolean lessThan(Byte left, Float right) { left.byteValue() < right.floatValue() }
	def dispatch boolean lessThan(Byte left, Long right) { left.byteValue() < right.longValue() }
	def dispatch boolean lessThan(Byte left, Short right) { left.byteValue() < right.shortValue() }
	def dispatch boolean lessThan(Byte left, Integer right) { left.byteValue() < right.intValue() }
	
	def dispatch boolean lessThan(Double left, Byte right) { left.doubleValue() < right.byteValue() }
	def dispatch boolean lessThan(Double left, Double right) { left.doubleValue() < right.doubleValue() }
	def dispatch boolean lessThan(Double left, Float right) { left.doubleValue() < right.floatValue() }
	def dispatch boolean lessThan(Double left, Long right) { left.doubleValue() < right.longValue() }
	def dispatch boolean lessThan(Double left, Short right) { left.doubleValue() < right.shortValue() }
	def dispatch boolean lessThan(Double left, Integer right) { left.doubleValue() < right.intValue() }
	
	def dispatch boolean lessThan(Float left, Byte right) { left.floatValue() < right.byteValue() }
	def dispatch boolean lessThan(Float left, Double right) { left.floatValue() < right.doubleValue() }
	def dispatch boolean lessThan(Float left, Float right) { left.floatValue() < right.floatValue() }
	def dispatch boolean lessThan(Float left, Long right) { left.floatValue() < right.longValue() }
	def dispatch boolean lessThan(Float left, Short right) { left.floatValue() < right.shortValue() }
	def dispatch boolean lessThan(Float left, Integer right) { left.floatValue() < right.intValue() }
	
	def dispatch boolean lessThan(Long left, Byte right) { left.longValue() < right.byteValue() }
	def dispatch boolean lessThan(Long left, Double right) { left.longValue() < right.doubleValue() }
	def dispatch boolean lessThan(Long left, Float right) { left.longValue() < right.floatValue() }
	def dispatch boolean lessThan(Long left, Long right) { left.longValue() < right.longValue() }
	def dispatch boolean lessThan(Long left, Short right) { left.longValue() < right.shortValue() }
	def dispatch boolean lessThan(Long left, Integer right) { left.longValue() < right.intValue() }
	
	def dispatch boolean lessThan(Short left, Byte right) { left.shortValue() < right.byteValue() }
	def dispatch boolean lessThan(Short left, Double right) { left.shortValue() < right.doubleValue() }
	def dispatch boolean lessThan(Short left, Float right) { left.shortValue() < right.floatValue() }
	def dispatch boolean lessThan(Short left, Long right) { left.shortValue() < right.longValue() }
	def dispatch boolean lessThan(Short left, Short right) { left.shortValue() < right.shortValue() }
	def dispatch boolean lessThan(Short left, Integer right) { left.shortValue() < right.intValue() }
	
	def dispatch boolean lessThan(Integer left, Byte right) { left.intValue() < right.byteValue() }
	def dispatch boolean lessThan(Integer left, Double right) { left.intValue() < right.doubleValue() }
	def dispatch boolean lessThan(Integer left, Float right) { left.intValue() < right.floatValue() }
	def dispatch boolean lessThan(Integer left, Long right) { left.intValue() < right.longValue() }
	def dispatch boolean lessThan(Integer left, Short right) { left.intValue() < right.shortValue() }
	def dispatch boolean lessThan(Integer left, Integer right) { left.intValue() < right.intValue() }
	
	def dispatch minus(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '-' for operands "+left+" and "+right);
	}
	
	
	def dispatch minus(Byte left, Byte right) { left.byteValue() - right.byteValue() }
	def dispatch minus(Byte left, Double right) { left.byteValue() - right.doubleValue() }
	def dispatch minus(Byte left, Float right) { left.byteValue() - right.floatValue() }
	def dispatch minus(Byte left, Long right) { left.byteValue() - right.longValue() }
	def dispatch minus(Byte left, Short right) { left.byteValue() - right.shortValue() }
	def dispatch minus(Byte left, Integer right) { left.byteValue() - right.intValue() }
	
	def dispatch minus(Double left, Byte right) { left.doubleValue() - right.byteValue() }
	def dispatch minus(Double left, Double right) { left.doubleValue() - right.doubleValue() }
	def dispatch minus(Double left, Float right) { left.doubleValue() - right.floatValue() }
	def dispatch minus(Double left, Long right) { left.doubleValue() - right.longValue() }
	def dispatch minus(Double left, Short right) { left.doubleValue() - right.shortValue() }
	def dispatch minus(Double left, Integer right) { left.doubleValue() - right.intValue() }
	
	def dispatch minus(Float left, Byte right) { left.floatValue() - right.byteValue() }
	def dispatch minus(Float left, Double right) { left.floatValue() - right.doubleValue() }
	def dispatch minus(Float left, Float right) { left.floatValue() - right.floatValue() }
	def dispatch minus(Float left, Long right) { left.floatValue() - right.longValue() }
	def dispatch minus(Float left, Short right) { left.floatValue() - right.shortValue() }
	def dispatch minus(Float left, Integer right) { left.floatValue() - right.intValue() }
	
	def dispatch minus(Long left, Byte right) { left.longValue() - right.byteValue() }
	def dispatch minus(Long left, Double right) { left.longValue() - right.doubleValue() }
	def dispatch minus(Long left, Float right) { left.longValue() - right.floatValue() }
	def dispatch minus(Long left, Long right) { left.longValue() - right.longValue() }
	def dispatch minus(Long left, Short right) { left.longValue() - right.shortValue() }
	def dispatch minus(Long left, Integer right) { left.longValue() - right.intValue() }
	
	def dispatch minus(Short left, Byte right) { left.shortValue() - right.byteValue() }
	def dispatch minus(Short left, Double right) { left.shortValue() - right.doubleValue() }
	def dispatch minus(Short left, Float right) { left.shortValue() - right.floatValue() }
	def dispatch minus(Short left, Long right) { left.shortValue() - right.longValue() }
	def dispatch minus(Short left, Short right) { left.shortValue() - right.shortValue() }
	def dispatch minus(Short left, Integer right) { left.shortValue() - right.intValue() }
	
	def dispatch minus(Integer left, Byte right) { left.intValue() - right.byteValue() }
	def dispatch minus(Integer left, Double right) { left.intValue() - right.doubleValue() }
	def dispatch minus(Integer left, Float right) { left.intValue() - right.floatValue() }
	def dispatch minus(Integer left, Long right) { left.intValue() - right.longValue() }
	def dispatch minus(Integer left, Short right) { left.intValue() - right.shortValue() }
	def dispatch minus(Integer left, Integer right) { left.intValue() - right.intValue() }
	
	def dispatch boolean greaterThan(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '>' for operands "+left+" and "+right);
	}
	
	
	def dispatch boolean greaterThan(Byte left, Byte right) { left.byteValue() > right.byteValue() }
	def dispatch boolean greaterThan(Byte left, Double right) { left.byteValue() > right.doubleValue() }
	def dispatch boolean greaterThan(Byte left, Float right) { left.byteValue() > right.floatValue() }
	def dispatch boolean greaterThan(Byte left, Long right) { left.byteValue() > right.longValue() }
	def dispatch boolean greaterThan(Byte left, Short right) { left.byteValue() > right.shortValue() }
	def dispatch boolean greaterThan(Byte left, Integer right) { left.byteValue() > right.intValue() }
	
	def dispatch boolean greaterThan(Double left, Byte right) { left.doubleValue() > right.byteValue() }
	def dispatch boolean greaterThan(Double left, Double right) { left.doubleValue() > right.doubleValue() }
	def dispatch boolean greaterThan(Double left, Float right) { left.doubleValue() > right.floatValue() }
	def dispatch boolean greaterThan(Double left, Long right) { left.doubleValue() > right.longValue() }
	def dispatch boolean greaterThan(Double left, Short right) { left.doubleValue() > right.shortValue() }
	def dispatch boolean greaterThan(Double left, Integer right) { left.doubleValue() > right.intValue() }
	
	def dispatch boolean greaterThan(Float left, Byte right) { left.floatValue() > right.byteValue() }
	def dispatch boolean greaterThan(Float left, Double right) { left.floatValue() > right.doubleValue() }
	def dispatch boolean greaterThan(Float left, Float right) { left.floatValue() > right.floatValue() }
	def dispatch boolean greaterThan(Float left, Long right) { left.floatValue() > right.longValue() }
	def dispatch boolean greaterThan(Float left, Short right) { left.floatValue() > right.shortValue() }
	def dispatch boolean greaterThan(Float left, Integer right) { left.floatValue() > right.intValue() }
	
	def dispatch boolean greaterThan(Long left, Byte right) { left.longValue() > right.byteValue() }
	def dispatch boolean greaterThan(Long left, Double right) { left.longValue() > right.doubleValue() }
	def dispatch boolean greaterThan(Long left, Float right) { left.longValue() > right.floatValue() }
	def dispatch boolean greaterThan(Long left, Long right) { left.longValue() > right.longValue() }
	def dispatch boolean greaterThan(Long left, Short right) { left.longValue() > right.shortValue() }
	def dispatch boolean greaterThan(Long left, Integer right) { left.longValue() > right.intValue() }
	
	def dispatch boolean greaterThan(Short left, Byte right) { left.shortValue() > right.byteValue() }
	def dispatch boolean greaterThan(Short left, Double right) { left.shortValue() > right.doubleValue() }
	def dispatch boolean greaterThan(Short left, Float right) { left.shortValue() > right.floatValue() }
	def dispatch boolean greaterThan(Short left, Long right) { left.shortValue() > right.longValue() }
	def dispatch boolean greaterThan(Short left, Short right) { left.shortValue() > right.shortValue() }
	def dispatch boolean greaterThan(Short left, Integer right) { left.shortValue() > right.intValue() }
	
	def dispatch boolean greaterThan(Integer left, Byte right) { left.intValue() > right.byteValue() }
	def dispatch boolean greaterThan(Integer left, Double right) { left.intValue() > right.doubleValue() }
	def dispatch boolean greaterThan(Integer left, Float right) { left.intValue() > right.floatValue() }
	def dispatch boolean greaterThan(Integer left, Long right) { left.intValue() > right.longValue() }
	def dispatch boolean greaterThan(Integer left, Short right) { left.intValue() > right.shortValue() }
	def dispatch boolean greaterThan(Integer left, Integer right) { left.intValue() > right.intValue() }
	
	def dispatch modulo(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '%' for operands "+left+" and "+right);
	}
	
	
	def dispatch modulo(Byte left, Byte right) { left.byteValue() % right.byteValue() }
	def dispatch modulo(Byte left, Double right) { left.byteValue() % right.doubleValue() }
	def dispatch modulo(Byte left, Float right) { left.byteValue() % right.floatValue() }
	def dispatch modulo(Byte left, Long right) { left.byteValue() % right.longValue() }
	def dispatch modulo(Byte left, Short right) { left.byteValue() % right.shortValue() }
	def dispatch modulo(Byte left, Integer right) { left.byteValue() % right.intValue() }
	
	def dispatch modulo(Double left, Byte right) { left.doubleValue() % right.byteValue() }
	def dispatch modulo(Double left, Double right) { left.doubleValue() % right.doubleValue() }
	def dispatch modulo(Double left, Float right) { left.doubleValue() % right.floatValue() }
	def dispatch modulo(Double left, Long right) { left.doubleValue() % right.longValue() }
	def dispatch modulo(Double left, Short right) { left.doubleValue() % right.shortValue() }
	def dispatch modulo(Double left, Integer right) { left.doubleValue() % right.intValue() }
	
	def dispatch modulo(Float left, Byte right) { left.floatValue() % right.byteValue() }
	def dispatch modulo(Float left, Double right) { left.floatValue() % right.doubleValue() }
	def dispatch modulo(Float left, Float right) { left.floatValue() % right.floatValue() }
	def dispatch modulo(Float left, Long right) { left.floatValue() % right.longValue() }
	def dispatch modulo(Float left, Short right) { left.floatValue() % right.shortValue() }
	def dispatch modulo(Float left, Integer right) { left.floatValue() % right.intValue() }
	
	def dispatch modulo(Long left, Byte right) { left.longValue() % right.byteValue() }
	def dispatch modulo(Long left, Double right) { left.longValue() % right.doubleValue() }
	def dispatch modulo(Long left, Float right) { left.longValue() % right.floatValue() }
	def dispatch modulo(Long left, Long right) { left.longValue() % right.longValue() }
	def dispatch modulo(Long left, Short right) { left.longValue() % right.shortValue() }
	def dispatch modulo(Long left, Integer right) { left.longValue() % right.intValue() }
	
	def dispatch modulo(Short left, Byte right) { left.shortValue() % right.byteValue() }
	def dispatch modulo(Short left, Double right) { left.shortValue() % right.doubleValue() }
	def dispatch modulo(Short left, Float right) { left.shortValue() % right.floatValue() }
	def dispatch modulo(Short left, Long right) { left.shortValue() % right.longValue() }
	def dispatch modulo(Short left, Short right) { left.shortValue() % right.shortValue() }
	def dispatch modulo(Short left, Integer right) { left.shortValue() % right.intValue() }
	
	def dispatch modulo(Integer left, Byte right) { left.intValue() % right.byteValue() }
	def dispatch modulo(Integer left, Double right) { left.intValue() % right.doubleValue() }
	def dispatch modulo(Integer left, Float right) { left.intValue() % right.floatValue() }
	def dispatch modulo(Integer left, Long right) { left.intValue() % right.longValue() }
	def dispatch modulo(Integer left, Short right) { left.intValue() % right.shortValue() }
	def dispatch modulo(Integer left, Integer right) { left.intValue() % right.intValue() }
	
	def dispatch multiply(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '*' for operands "+left+" and "+right);
	}
	
	
	def dispatch multiply(Byte left, Byte right) { left.byteValue() * right.byteValue() }
	def dispatch multiply(Byte left, Double right) { left.byteValue() * right.doubleValue() }
	def dispatch multiply(Byte left, Float right) { left.byteValue() * right.floatValue() }
	def dispatch multiply(Byte left, Long right) { left.byteValue() * right.longValue() }
	def dispatch multiply(Byte left, Short right) { left.byteValue() * right.shortValue() }
	def dispatch multiply(Byte left, Integer right) { left.byteValue() * right.intValue() }
	
	def dispatch multiply(Double left, Byte right) { left.doubleValue() * right.byteValue() }
	def dispatch multiply(Double left, Double right) { left.doubleValue() * right.doubleValue() }
	def dispatch multiply(Double left, Float right) { left.doubleValue() * right.floatValue() }
	def dispatch multiply(Double left, Long right) { left.doubleValue() * right.longValue() }
	def dispatch multiply(Double left, Short right) { left.doubleValue() * right.shortValue() }
	def dispatch multiply(Double left, Integer right) { left.doubleValue() * right.intValue() }
	
	def dispatch multiply(Float left, Byte right) { left.floatValue() * right.byteValue() }
	def dispatch multiply(Float left, Double right) { left.floatValue() * right.doubleValue() }
	def dispatch multiply(Float left, Float right) { left.floatValue() * right.floatValue() }
	def dispatch multiply(Float left, Long right) { left.floatValue() * right.longValue() }
	def dispatch multiply(Float left, Short right) { left.floatValue() * right.shortValue() }
	def dispatch multiply(Float left, Integer right) { left.floatValue() * right.intValue() }
	
	def dispatch multiply(Long left, Byte right) { left.longValue() * right.byteValue() }
	def dispatch multiply(Long left, Double right) { left.longValue() * right.doubleValue() }
	def dispatch multiply(Long left, Float right) { left.longValue() * right.floatValue() }
	def dispatch multiply(Long left, Long right) { left.longValue() * right.longValue() }
	def dispatch multiply(Long left, Short right) { left.longValue() * right.shortValue() }
	def dispatch multiply(Long left, Integer right) { left.longValue() * right.intValue() }
	
	def dispatch multiply(Short left, Byte right) { left.shortValue() * right.byteValue() }
	def dispatch multiply(Short left, Double right) { left.shortValue() * right.doubleValue() }
	def dispatch multiply(Short left, Float right) { left.shortValue() * right.floatValue() }
	def dispatch multiply(Short left, Long right) { left.shortValue() * right.longValue() }
	def dispatch multiply(Short left, Short right) { left.shortValue() * right.shortValue() }
	def dispatch multiply(Short left, Integer right) { left.shortValue() * right.intValue() }
	
	def dispatch multiply(Integer left, Byte right) { left.intValue() * right.byteValue() }
	def dispatch multiply(Integer left, Double right) { left.intValue() * right.doubleValue() }
	def dispatch multiply(Integer left, Float right) { left.intValue() * right.floatValue() }
	def dispatch multiply(Integer left, Long right) { left.intValue() * right.longValue() }
	def dispatch multiply(Integer left, Short right) { left.intValue() * right.shortValue() }
	def dispatch multiply(Integer left, Integer right) { left.intValue() * right.intValue() }
	
	def dispatch divide(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '/' for operands "+left+" and "+right);
	}
	
	
	def dispatch divide(Byte left, Byte right) { left.byteValue() / right.byteValue() }
	def dispatch divide(Byte left, Double right) { left.byteValue() / right.doubleValue() }
	def dispatch divide(Byte left, Float right) { left.byteValue() / right.floatValue() }
	def dispatch divide(Byte left, Long right) { left.byteValue() / right.longValue() }
	def dispatch divide(Byte left, Short right) { left.byteValue() / right.shortValue() }
	def dispatch divide(Byte left, Integer right) { left.byteValue() / right.intValue() }
	
	def dispatch divide(Double left, Byte right) { left.doubleValue() / right.byteValue() }
	def dispatch divide(Double left, Double right) { left.doubleValue() / right.doubleValue() }
	def dispatch divide(Double left, Float right) { left.doubleValue() / right.floatValue() }
	def dispatch divide(Double left, Long right) { left.doubleValue() / right.longValue() }
	def dispatch divide(Double left, Short right) { left.doubleValue() / right.shortValue() }
	def dispatch divide(Double left, Integer right) { left.doubleValue() / right.intValue() }
	
	def dispatch divide(Float left, Byte right) { left.floatValue() / right.byteValue() }
	def dispatch divide(Float left, Double right) { left.floatValue() / right.doubleValue() }
	def dispatch divide(Float left, Float right) { left.floatValue() / right.floatValue() }
	def dispatch divide(Float left, Long right) { left.floatValue() / right.longValue() }
	def dispatch divide(Float left, Short right) { left.floatValue() / right.shortValue() }
	def dispatch divide(Float left, Integer right) { left.floatValue() / right.intValue() }
	
	def dispatch divide(Long left, Byte right) { left.longValue() / right.byteValue() }
	def dispatch divide(Long left, Double right) { left.longValue() / right.doubleValue() }
	def dispatch divide(Long left, Float right) { left.longValue() / right.floatValue() }
	def dispatch divide(Long left, Long right) { left.longValue() / right.longValue() }
	def dispatch divide(Long left, Short right) { left.longValue() / right.shortValue() }
	def dispatch divide(Long left, Integer right) { left.longValue() / right.intValue() }
	
	def dispatch divide(Short left, Byte right) { left.shortValue() / right.byteValue() }
	def dispatch divide(Short left, Double right) { left.shortValue() / right.doubleValue() }
	def dispatch divide(Short left, Float right) { left.shortValue() / right.floatValue() }
	def dispatch divide(Short left, Long right) { left.shortValue() / right.longValue() }
	def dispatch divide(Short left, Short right) { left.shortValue() / right.shortValue() }
	def dispatch divide(Short left, Integer right) { left.shortValue() / right.intValue() }
	
	def dispatch divide(Integer left, Byte right) { left.intValue() / right.byteValue() }
	def dispatch divide(Integer left, Double right) { left.intValue() / right.doubleValue() }
	def dispatch divide(Integer left, Float right) { left.intValue() / right.floatValue() }
	def dispatch divide(Integer left, Long right) { left.intValue() / right.longValue() }
	def dispatch divide(Integer left, Short right) { left.intValue() / right.shortValue() }
	def dispatch divide(Integer left, Integer right) { left.intValue() / right.intValue() }
	
	def dispatch boolean same(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '===' for operands "+left+" and "+right);
	}
	
	
	def dispatch boolean same(Byte left, Byte right) { left.byteValue() === right.byteValue() }
	def dispatch boolean same(Byte left, Double right) { left.byteValue() === right.doubleValue() }
	def dispatch boolean same(Byte left, Float right) { left.byteValue() === right.floatValue() }
	def dispatch boolean same(Byte left, Long right) { left.byteValue() === right.longValue() }
	def dispatch boolean same(Byte left, Short right) { left.byteValue() === right.shortValue() }
	def dispatch boolean same(Byte left, Integer right) { left.byteValue() === right.intValue() }
	
	def dispatch boolean same(Double left, Byte right) { left.doubleValue() === right.byteValue() }
	def dispatch boolean same(Double left, Double right) { left.doubleValue() === right.doubleValue() }
	def dispatch boolean same(Double left, Float right) { left.doubleValue() === right.floatValue() }
	def dispatch boolean same(Double left, Long right) { left.doubleValue() === right.longValue() }
	def dispatch boolean same(Double left, Short right) { left.doubleValue() === right.shortValue() }
	def dispatch boolean same(Double left, Integer right) { left.doubleValue() === right.intValue() }
	
	def dispatch boolean same(Float left, Byte right) { left.floatValue() === right.byteValue() }
	def dispatch boolean same(Float left, Double right) { left.floatValue() === right.doubleValue() }
	def dispatch boolean same(Float left, Float right) { left.floatValue() === right.floatValue() }
	def dispatch boolean same(Float left, Long right) { left.floatValue() === right.longValue() }
	def dispatch boolean same(Float left, Short right) { left.floatValue() === right.shortValue() }
	def dispatch boolean same(Float left, Integer right) { left.floatValue() === right.intValue() }
	
	def dispatch boolean same(Long left, Byte right) { left.longValue() === right.byteValue() }
	def dispatch boolean same(Long left, Double right) { left.longValue() === right.doubleValue() }
	def dispatch boolean same(Long left, Float right) { left.longValue() === right.floatValue() }
	def dispatch boolean same(Long left, Long right) { left.longValue() === right.longValue() }
	def dispatch boolean same(Long left, Short right) { left.longValue() === right.shortValue() }
	def dispatch boolean same(Long left, Integer right) { left.longValue() === right.intValue() }
	
	def dispatch boolean same(Short left, Byte right) { left.shortValue() === right.byteValue() }
	def dispatch boolean same(Short left, Double right) { left.shortValue() === right.doubleValue() }
	def dispatch boolean same(Short left, Float right) { left.shortValue() === right.floatValue() }
	def dispatch boolean same(Short left, Long right) { left.shortValue() === right.longValue() }
	def dispatch boolean same(Short left, Short right) { left.shortValue() === right.shortValue() }
	def dispatch boolean same(Short left, Integer right) { left.shortValue() === right.intValue() }
	
	def dispatch boolean same(Integer left, Byte right) { left.intValue() === right.byteValue() }
	def dispatch boolean same(Integer left, Double right) { left.intValue() === right.doubleValue() }
	def dispatch boolean same(Integer left, Float right) { left.intValue() === right.floatValue() }
	def dispatch boolean same(Integer left, Long right) { left.intValue() === right.longValue() }
	def dispatch boolean same(Integer left, Short right) { left.intValue() === right.shortValue() }
	def dispatch boolean same(Integer left, Integer right) { left.intValue() === right.intValue() }
	
	def dispatch boolean lessEquals(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '<=' for operands "+left+" and "+right);
	}
	
	
	def dispatch boolean lessEquals(Byte left, Byte right) { left.byteValue() <= right.byteValue() }
	def dispatch boolean lessEquals(Byte left, Double right) { left.byteValue() <= right.doubleValue() }
	def dispatch boolean lessEquals(Byte left, Float right) { left.byteValue() <= right.floatValue() }
	def dispatch boolean lessEquals(Byte left, Long right) { left.byteValue() <= right.longValue() }
	def dispatch boolean lessEquals(Byte left, Short right) { left.byteValue() <= right.shortValue() }
	def dispatch boolean lessEquals(Byte left, Integer right) { left.byteValue() <= right.intValue() }
	
	def dispatch boolean lessEquals(Double left, Byte right) { left.doubleValue() <= right.byteValue() }
	def dispatch boolean lessEquals(Double left, Double right) { left.doubleValue() <= right.doubleValue() }
	def dispatch boolean lessEquals(Double left, Float right) { left.doubleValue() <= right.floatValue() }
	def dispatch boolean lessEquals(Double left, Long right) { left.doubleValue() <= right.longValue() }
	def dispatch boolean lessEquals(Double left, Short right) { left.doubleValue() <= right.shortValue() }
	def dispatch boolean lessEquals(Double left, Integer right) { left.doubleValue() <= right.intValue() }
	
	def dispatch boolean lessEquals(Float left, Byte right) { left.floatValue() <= right.byteValue() }
	def dispatch boolean lessEquals(Float left, Double right) { left.floatValue() <= right.doubleValue() }
	def dispatch boolean lessEquals(Float left, Float right) { left.floatValue() <= right.floatValue() }
	def dispatch boolean lessEquals(Float left, Long right) { left.floatValue() <= right.longValue() }
	def dispatch boolean lessEquals(Float left, Short right) { left.floatValue() <= right.shortValue() }
	def dispatch boolean lessEquals(Float left, Integer right) { left.floatValue() <= right.intValue() }
	
	def dispatch boolean lessEquals(Long left, Byte right) { left.longValue() <= right.byteValue() }
	def dispatch boolean lessEquals(Long left, Double right) { left.longValue() <= right.doubleValue() }
	def dispatch boolean lessEquals(Long left, Float right) { left.longValue() <= right.floatValue() }
	def dispatch boolean lessEquals(Long left, Long right) { left.longValue() <= right.longValue() }
	def dispatch boolean lessEquals(Long left, Short right) { left.longValue() <= right.shortValue() }
	def dispatch boolean lessEquals(Long left, Integer right) { left.longValue() <= right.intValue() }
	
	def dispatch boolean lessEquals(Short left, Byte right) { left.shortValue() <= right.byteValue() }
	def dispatch boolean lessEquals(Short left, Double right) { left.shortValue() <= right.doubleValue() }
	def dispatch boolean lessEquals(Short left, Float right) { left.shortValue() <= right.floatValue() }
	def dispatch boolean lessEquals(Short left, Long right) { left.shortValue() <= right.longValue() }
	def dispatch boolean lessEquals(Short left, Short right) { left.shortValue() <= right.shortValue() }
	def dispatch boolean lessEquals(Short left, Integer right) { left.shortValue() <= right.intValue() }
	
	def dispatch boolean lessEquals(Integer left, Byte right) { left.intValue() <= right.byteValue() }
	def dispatch boolean lessEquals(Integer left, Double right) { left.intValue() <= right.doubleValue() }
	def dispatch boolean lessEquals(Integer left, Float right) { left.intValue() <= right.floatValue() }
	def dispatch boolean lessEquals(Integer left, Long right) { left.intValue() <= right.longValue() }
	def dispatch boolean lessEquals(Integer left, Short right) { left.intValue() <= right.shortValue() }
	def dispatch boolean lessEquals(Integer left, Integer right) { left.intValue() <= right.intValue() }
	
	def dispatch boolean greaterEquals(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '>=' for operands "+left+" and "+right);
	}
	
	
	def dispatch boolean greaterEquals(Byte left, Byte right) { left.byteValue() >= right.byteValue() }
	def dispatch boolean greaterEquals(Byte left, Double right) { left.byteValue() >= right.doubleValue() }
	def dispatch boolean greaterEquals(Byte left, Float right) { left.byteValue() >= right.floatValue() }
	def dispatch boolean greaterEquals(Byte left, Long right) { left.byteValue() >= right.longValue() }
	def dispatch boolean greaterEquals(Byte left, Short right) { left.byteValue() >= right.shortValue() }
	def dispatch boolean greaterEquals(Byte left, Integer right) { left.byteValue() >= right.intValue() }
	
	def dispatch boolean greaterEquals(Double left, Byte right) { left.doubleValue() >= right.byteValue() }
	def dispatch boolean greaterEquals(Double left, Double right) { left.doubleValue() >= right.doubleValue() }
	def dispatch boolean greaterEquals(Double left, Float right) { left.doubleValue() >= right.floatValue() }
	def dispatch boolean greaterEquals(Double left, Long right) { left.doubleValue() >= right.longValue() }
	def dispatch boolean greaterEquals(Double left, Short right) { left.doubleValue() >= right.shortValue() }
	def dispatch boolean greaterEquals(Double left, Integer right) { left.doubleValue() >= right.intValue() }
	
	def dispatch boolean greaterEquals(Float left, Byte right) { left.floatValue() >= right.byteValue() }
	def dispatch boolean greaterEquals(Float left, Double right) { left.floatValue() >= right.doubleValue() }
	def dispatch boolean greaterEquals(Float left, Float right) { left.floatValue() >= right.floatValue() }
	def dispatch boolean greaterEquals(Float left, Long right) { left.floatValue() >= right.longValue() }
	def dispatch boolean greaterEquals(Float left, Short right) { left.floatValue() >= right.shortValue() }
	def dispatch boolean greaterEquals(Float left, Integer right) { left.floatValue() >= right.intValue() }
	
	def dispatch boolean greaterEquals(Long left, Byte right) { left.longValue() >= right.byteValue() }
	def dispatch boolean greaterEquals(Long left, Double right) { left.longValue() >= right.doubleValue() }
	def dispatch boolean greaterEquals(Long left, Float right) { left.longValue() >= right.floatValue() }
	def dispatch boolean greaterEquals(Long left, Long right) { left.longValue() >= right.longValue() }
	def dispatch boolean greaterEquals(Long left, Short right) { left.longValue() >= right.shortValue() }
	def dispatch boolean greaterEquals(Long left, Integer right) { left.longValue() >= right.intValue() }
	
	def dispatch boolean greaterEquals(Short left, Byte right) { left.shortValue() >= right.byteValue() }
	def dispatch boolean greaterEquals(Short left, Double right) { left.shortValue() >= right.doubleValue() }
	def dispatch boolean greaterEquals(Short left, Float right) { left.shortValue() >= right.floatValue() }
	def dispatch boolean greaterEquals(Short left, Long right) { left.shortValue() >= right.longValue() }
	def dispatch boolean greaterEquals(Short left, Short right) { left.shortValue() >= right.shortValue() }
	def dispatch boolean greaterEquals(Short left, Integer right) { left.shortValue() >= right.intValue() }
	
	def dispatch boolean greaterEquals(Integer left, Byte right) { left.intValue() >= right.byteValue() }
	def dispatch boolean greaterEquals(Integer left, Double right) { left.intValue() >= right.doubleValue() }
	def dispatch boolean greaterEquals(Integer left, Float right) { left.intValue() >= right.floatValue() }
	def dispatch boolean greaterEquals(Integer left, Long right) { left.intValue() >= right.longValue() }
	def dispatch boolean greaterEquals(Integer left, Short right) { left.intValue() >= right.shortValue() }
	def dispatch boolean greaterEquals(Integer left, Integer right) { left.intValue() >= right.intValue() }
	
	def dispatch boolean notSame(Object left, Object right) {
		throw new ConstantExpressionEvaluationException("Unsupported operator '!==' for operands "+left+" and "+right);
	}
	
	
	def dispatch boolean notSame(Byte left, Byte right) { left.byteValue() !== right.byteValue() }
	def dispatch boolean notSame(Byte left, Double right) { left.byteValue() !== right.doubleValue() }
	def dispatch boolean notSame(Byte left, Float right) { left.byteValue() !== right.floatValue() }
	def dispatch boolean notSame(Byte left, Long right) { left.byteValue() !== right.longValue() }
	def dispatch boolean notSame(Byte left, Short right) { left.byteValue() !== right.shortValue() }
	def dispatch boolean notSame(Byte left, Integer right) { left.byteValue() !== right.intValue() }
	
	def dispatch boolean notSame(Double left, Byte right) { left.doubleValue() !== right.byteValue() }
	def dispatch boolean notSame(Double left, Double right) { left.doubleValue() !== right.doubleValue() }
	def dispatch boolean notSame(Double left, Float right) { left.doubleValue() !== right.floatValue() }
	def dispatch boolean notSame(Double left, Long right) { left.doubleValue() !== right.longValue() }
	def dispatch boolean notSame(Double left, Short right) { left.doubleValue() !== right.shortValue() }
	def dispatch boolean notSame(Double left, Integer right) { left.doubleValue() !== right.intValue() }
	
	def dispatch boolean notSame(Float left, Byte right) { left.floatValue() !== right.byteValue() }
	def dispatch boolean notSame(Float left, Double right) { left.floatValue() !== right.doubleValue() }
	def dispatch boolean notSame(Float left, Float right) { left.floatValue() !== right.floatValue() }
	def dispatch boolean notSame(Float left, Long right) { left.floatValue() !== right.longValue() }
	def dispatch boolean notSame(Float left, Short right) { left.floatValue() !== right.shortValue() }
	def dispatch boolean notSame(Float left, Integer right) { left.floatValue() !== right.intValue() }
	
	def dispatch boolean notSame(Long left, Byte right) { left.longValue() !== right.byteValue() }
	def dispatch boolean notSame(Long left, Double right) { left.longValue() !== right.doubleValue() }
	def dispatch boolean notSame(Long left, Float right) { left.longValue() !== right.floatValue() }
	def dispatch boolean notSame(Long left, Long right) { left.longValue() !== right.longValue() }
	def dispatch boolean notSame(Long left, Short right) { left.longValue() !== right.shortValue() }
	def dispatch boolean notSame(Long left, Integer right) { left.longValue() !== right.intValue() }
	
	def dispatch boolean notSame(Short left, Byte right) { left.shortValue() !== right.byteValue() }
	def dispatch boolean notSame(Short left, Double right) { left.shortValue() !== right.doubleValue() }
	def dispatch boolean notSame(Short left, Float right) { left.shortValue() !== right.floatValue() }
	def dispatch boolean notSame(Short left, Long right) { left.shortValue() !== right.longValue() }
	def dispatch boolean notSame(Short left, Short right) { left.shortValue() !== right.shortValue() }
	def dispatch boolean notSame(Short left, Integer right) { left.shortValue() !== right.intValue() }
	
	def dispatch boolean notSame(Integer left, Byte right) { left.intValue() !== right.byteValue() }
	def dispatch boolean notSame(Integer left, Double right) { left.intValue() !== right.doubleValue() }
	def dispatch boolean notSame(Integer left, Float right) { left.intValue() !== right.floatValue() }
	def dispatch boolean notSame(Integer left, Long right) { left.intValue() !== right.longValue() }
	def dispatch boolean notSame(Integer left, Short right) { left.intValue() !== right.shortValue() }
	def dispatch boolean notSame(Integer left, Integer right) { left.intValue() !== right.intValue() }

}