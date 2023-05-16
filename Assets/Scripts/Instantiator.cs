using System.Collections;
using System.Collections.Generic;
using ThinkEngine;
using ThinkEngine.it.unical.mat.objectsMapper.BrainsScripts.DCS;
using ThinkEngine.it.unical.mat.objectsMapper.BrainsScripts.Specialitations.ASP;
using UnityEngine;

public class Instantiator : CustomInstantiator
{
    public PrefabInstantiator instantiator;
    public float tileWidth = 2.56f;
    public float tileHeight = 2.56f;
    public int sceneHeight = 10;
    void Start()
    {
        Debug.Log("Starting");
        instantiator = Utility.PrefabInstantiator;
    }
    // Start is called before the first frame update
    public override void ParseLiteral(string predicateName, string[] arguments)
    {
        Debug.Log(predicateName + ":");
        foreach (string argument in arguments)
        {
            Debug.Log(argument);
        }
        if (predicateName =="current_asset")
        {
            CheckCurrentAsset( arguments);
        }
        else if (predicateName == "reachable")
        {
            CheckReachable(arguments);
        }
        else if (predicateName == "has_state")
        {
            CheckHasState(arguments);
        }
    }
    private  void CheckHasState(string[] arguments)//arguments[0]=tile(X,Y), arguments[1]="state"
    {
        Debug.Log("Has state:");
        string substring = "tile(";
        string temp = arguments[0].Substring(substring.Length, arguments[0].Length-substring.Length-1);
        string[] values = temp.Split(',');
        if (values.Length == 2)
        {
        Debug.Log("ok:");
            if (int.TryParse(values[0], out int stripe) && int.TryParse(values[1], out int tile))
            {
                float pX = stripe * tileWidth - tileWidth / 2;
                float pY = sceneHeight * tileHeight - tile * tileHeight + tileHeight / 2;
                //Debug.Log("Requisting to instantiate in " + pX + " " + pY);
                instantiator.InstantiateByName(new Vector3(pX, pY, 0), arguments[1]);
            }
        }
    }

    private  void CheckReachable(string[] arguments)//arguments[0]=tile(X,Y)
    {
        Debug.Log("Reachable:");
        string substring = "tile(";
        string temp = arguments[0].Substring(substring.Length, arguments[0].Length - substring.Length - 2);
        string[] values = temp.Split(',');
        if (values.Length == 2)
        {
        Debug.Log("Ok");
            if (int.TryParse(values[0], out int stripe) && int.TryParse(values[1], out int tile))
            {
                float pX = stripe * tileWidth - tileWidth / 2;
                float pY = sceneHeight * tileHeight - tile * tileHeight + tileHeight / 2;
                //Debug.Log("Requisting to instantiate in " + pX + " " + pY);
                instantiator.InstantiateByName(new Vector3(pX, pY, 0), "reach");
            }
        }
    }

    private  void CheckCurrentAsset(string[] arguments)
    {
        Debug.Log("CurrentAsset:");

        if (int.TryParse(arguments[0], out int stripe) && int.TryParse(arguments[1], out int tile) && int.TryParse(arguments[2], out int index))
        {
        Debug.Log("Ok:");
            if (ContentPrefabConfigurator.instances.ContainsKey(index))
            {
                float pX = stripe * tileWidth - tileWidth / 2;
                float pY = sceneHeight * tileHeight - tile * tileHeight + tileHeight / 2;
                //Debug.Log("Requisting to instantiate in " + pX + " " + pY);
                instantiator.InstantiatePrefab(index, new Vector3(pX, pY, 0), new Quaternion(0, 0, 0, 0));
            }
        }
    }
}
