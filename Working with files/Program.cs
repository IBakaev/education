using System;
using System.IO;

namespace Working_with_files
{
    class Program
    {


        static void Main(string[] args)
        {
            double sum = 0;
            int temp = 0;            
            Random random = new Random();
            StreamWriter f = new StreamWriter($"{random.Next(-255, 255)}.txt");
            Console.WriteLine("Введите количество чисел: ");
            Console.WriteLine("----------------------------------");
            int numbers = Convert.ToInt32(Console.ReadLine());
            f.WriteLine("Сгенерированные числа: ");
            f.WriteLine("----------------------------------");
            for (int i = 0; i <= numbers - 1; i++)
            {
                temp = random.Next(-10, 10);
                f.WriteLine($"{temp}");
                sum += Math.Pow(temp, 2);
            }
            f.WriteLine("----------------------------------");
            f.WriteLine($"Сумма квадратов чисел = {sum}");
            f.WriteLine("----------------------------------");
            f.Close();
            Console.WriteLine("----------------------------------");
            Console.WriteLine("Для просмотра результатов перейдите в сгенерированный текстовый файл.");
        }
    }
}
