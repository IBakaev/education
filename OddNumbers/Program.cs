using System;

namespace OddNumbers
{
    class Program
    {
        void OddCounter(char[] array, out int counter)
        {
            counter = 0;
            for (int i = 0; i < array.Length; i++)
            {
                if (array[i] % 2 != 0)
                    counter++;
            }
        }
        static void Main(string[] args)
        {
            var obj = new Program();
            Console.WriteLine("Введите натуральное число: ");
            string someNumber = Console.ReadLine();
            char[] chArray = someNumber.ToCharArray();
            obj.OddCounter(chArray, out int counter);
            Console.WriteLine($"Количество нечётных цифр в числе {someNumber}: {counter}");
        }
    }
}
