using System.Xml;
using System.Xml.Serialization;

public class Question
{ 
	[XmlAttribute("text")]
	public string Text;

	public string DBName;
	public int Type;
}