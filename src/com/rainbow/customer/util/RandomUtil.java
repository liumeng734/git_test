package com.rainbow.customer.util;

import java.util.Random;

public class RandomUtil {

	public static int getRandom(){
		 Random random = new Random();
		 return Math.abs(random.nextInt())%10000;
	}
}
