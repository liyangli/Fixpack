package com.bohui.service;

import org.junit.Test;

public class FixPackServiceTest {

	@Test
	public void fixPack() {
		FixPackService fps = new FixPackService();
		try {
			fps.fixPack("D:\\test\\");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
