package org.eclipse.xtext.parsetree;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.core.parsetree.AbstractNode;
import org.eclipse.xtext.core.parsetree.CompositeNode;
import org.eclipse.xtext.dummy.DummyLanguage;
import org.eclipse.xtext.generator.tests.AbstractGeneratorTest;

public class ASTChangeTest extends AbstractGeneratorTest {

	public void testWhitespaceIsIncluded() throws Exception {
		String model = "element foo;\nelement bar;";
		CompositeNode node = getRootNode(model);
		EObject me = node.getElement();
		assertWithXtend("'foo'", "elements.first().name", me);
		invokeWithXtend("elements.first().setName('stuff')", me);
		assertWithXtend("'stuff'", "elements.first().name", me);
		
//		assertEquals("element stuff;\nelement bar;", node.serialize());
	}

	@Override
	protected Class<?> getTheClass() {
		return DummyLanguage.class;
	}
	
}
