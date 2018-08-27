using System;
using UnityEngine;

[Serializable]
public class TypeDescription
{
    [SerializeField] string name;

    public TypeDescription(string typeName)
    {
        name = typeName;
    }

    public static implicit operator TypeDescription(string name)
    {
        return new TypeDescription(name);
    }

    public static implicit operator Type(TypeDescription typeDesc)
    {
        return Type.GetType(typeDesc.name);
    }

    public static implicit operator TypeDescription(Type type)
    {
        if (!string.IsNullOrEmpty(type.Namespace)) return new TypeDescription(string.Format("{0}.{1}", type.Namespace, type.Name));
        return new TypeDescription(type.Name);
    }

    public override string ToString()
    {
        return "TypeDescription: " + name;
    }
}