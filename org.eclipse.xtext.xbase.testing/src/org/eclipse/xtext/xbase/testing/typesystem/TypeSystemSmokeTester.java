/*******************************************************************************
 * Copyright (c) 2014, 2017 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.xbase.testing.typesystem;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Pattern;

import org.eclipse.xtext.testing.smoketest.ScenarioProcessor;

import com.google.inject.Inject;
import com.google.inject.Singleton;

/**
 * @author Sebastian Zarnekow - Initial contribution and API
 */
@Singleton
public class TypeSystemSmokeTester extends ScenarioProcessor {
	@Inject
	private Oven oven;
	
	private static final Pattern WS = Pattern.compile("\\s{2,}");
	
	private MessageDigest messageDigest;
	private Set<BigInteger> seen;
	
	public TypeSystemSmokeTester() throws NoSuchAlgorithmException {
		messageDigest = MessageDigest.getInstance("MD5");
		seen = Collections.newSetFromMap(new ConcurrentHashMap<BigInteger, Boolean>());
	}
	
	@Override
	public String preProcess(String data) {
		return WS.matcher(data).replaceAll(" ");
	}
	
	@Override
	public void processFile(String data) throws Exception {
		byte[] hash = ((MessageDigest) messageDigest.clone()).digest(data.getBytes("UTF-8"));
		if (seen.add(new BigInteger(hash))) {
			oven.fireproof(data);
		}
	}
}
