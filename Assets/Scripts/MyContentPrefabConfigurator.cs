using System.Collections;
using System.Collections.Generic;
using ThinkEngine.it.unical.mat.objectsMapper.BrainsScripts.DCS;
using UnityEngine;

public class MyContentPrefabConfigurator : ContentPrefabConfigurator
{
    [Mappable]
    public bool test;
    [Mappable]
    public List<ContentPrefabConfigurator> leftRight;
    // Start is called before the first frame update
    private void Awake()
    {
        if(leftRight == null)
        {
            leftRight = new List<ContentPrefabConfigurator>();
        }
    }
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
