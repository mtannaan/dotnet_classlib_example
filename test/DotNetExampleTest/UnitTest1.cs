using System;
using Xunit;

namespace DotNetExampleTest
{
    public class UnitTest1
    {
        [Fact]
        public void WillSucceed()
        {
            Assert.Equal(
                "henlo fren",
                DotNetExample.Class1.Greet()
            );
        }

        [Fact]
        public void WillFail()
        {
            Assert.Equal(
                "boop",
                DotNetExample.Class1.Greet()
            );
        }
    }
}
