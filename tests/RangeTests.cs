using System;
using Xunit;
using api.Controllers;
using System.Linq;

namespace tests
{
    public class RangeTests
    {
        [Fact]
        public void CountShouldControlNumberOfResutls()
        {
            var range=new Range{Count=3};
            var generated = range.Of(() => "");

            Assert.Equal(3, generated.Count());

        }

        [Fact]
        public void CountShouldOrderResult()
        {
            var range = new Range { Count = 3 ,Sort=true};
            var values = new[] { "a", "c", "b" };
            var counter = 0;
            var generated = range.Of(() => values[counter++]);

            Assert.Equal(new[] { "a", "b", "c" }, generated.ToArray());

        }
    }
}
