namespace SomeNamespace
{
    public class SomeClass
    {
        public string name {get;set;}
        public string SayHi()
        {
            return $"Hello, {this.name}";
        }
    }
}