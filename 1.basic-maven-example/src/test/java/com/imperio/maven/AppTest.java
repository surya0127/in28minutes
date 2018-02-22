package com.imperio.maven;

import static org.junit.Assert.*;

import org.junit.Test;

import com.imperio.maven.App;

public class AppTest 
{
	@Test
	public void testApp()
    {
        assertEquals(0,new App().calculateSomething());
    }
}
