using System;
using UnityEngine;

// every method of this class without parameters and that returns a bool value can be used to trigger the reasoner.
 namespace ThinkEngine 
{
	 public class ThinkEngineTrigger:ScriptableObject
	{
		// Application.targetFrameRate = 1;
		int cont = 0;
		public bool Run()
        {
			if(cont == 1)
            {
				cont = 0;
				return true;
            }
			cont++;
			return false;
        }

	}
}