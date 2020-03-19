dotnet new gitignore

$SRCDIR = 'src/DotNetExample'
New-Item -ItemType Directory -Path $SRCDIR -ErrorAction Ignore
Set-Location $SRCDIR

dotnet new classlib
$src = @"
namespace DotNetExample
{
    public class Class1
    {
        public static string Greet(){
            return "henlo fren";
        }
    }
}
"@
Set-Content -Path "./Class1.cs" -Value $src -Force


Set-Location "../.."

$TESTDIR = 'test/DotNetExampleTest'
New-Item -ItemType Directory -Path $TESTDIR -ErrorAction Ignore
Set-Location $TESTDIR
dotnet new xunit

dotnet add reference "../../${SRCDIR}/DotNetExample.csproj"
$test = @"
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
"@
Set-Content -Path "./UnitTest1.cs" -Value $test -Force

dotnet test
