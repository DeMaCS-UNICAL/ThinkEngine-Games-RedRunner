using System;
using UnityEngine;

// every method of this class without parameters and that returns a bool value can be used to trigger the reasoner.
 namespace ThinkEngine 
{
	 public class ThinkEngineTrigger:ScriptableObject
	{
		int cont = 0;
		public bool Run()
        {
			if(cont == 100)
            {
				cont = 0;
				return true;
            }
			return false;
        }

	}
}