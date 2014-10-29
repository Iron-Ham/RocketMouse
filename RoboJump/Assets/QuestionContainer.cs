using System.Collections.Generic;
using System.Xml.Serialization;
using System.IO;

[XmlRoot("QuestionCollection")]
public class QuestionContainer
{
	[XmlArray("Questions")]
	[XmlArrayItem("Question")]
	public List<Question> Questions = new List<Question>();

	public static QuestionContainer Load(string path)
	{
		var serializer = new XmlSerializer(typeof(QuestionContainer));
		using(var stream = new FileStream(path, FileMode.Open))
		{
			return serializer.Deserialize(stream) as QuestionContainer;
		}
	}
}