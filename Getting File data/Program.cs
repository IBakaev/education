using System;
using System.IO;

namespace Getting_File_data
{

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Введите имя текстового файла из корневого каталога локального диска С: ");
            Console.WriteLine("--------------------------------------------------------------------------");
            string path = @"c:\" + Console.ReadLine() + ".txt";
            Console.WriteLine("--------------------------------------------------------------------------");
            if (File.Exists(path))
            {
                StreamWriter f = new StreamWriter(path);
                string creationTime = File.GetCreationTime(path).ToString();
                f.WriteLine($"Время создания файла: {File.GetCreationTime(path).ToString()}");
                string lastAccessTime = File.GetLastAccessTime(path).ToString();
                string lastEntryTime = File.GetLastWriteTime(path).ToString();
                Console.WriteLine("Время создания файла: " + creationTime);
                Console.WriteLine("--------------------------------------------------------------------------");
                Console.WriteLine("Время последнего доступа к файлу: " + lastAccessTime);
                Console.WriteLine("--------------------------------------------------------------------------");
                Console.WriteLine("Время последней перезаписи файла: " + lastEntryTime);
                Console.WriteLine("--------------------------------------------------------------------------");
                f.WriteLine($"\nВремя последнего доступа к файлу: {lastAccessTime}");
                f.WriteLine($"\nВремя последней перезаписи файла: {lastEntryTime}");
                f.Close();
            }
            else
            {
                Console.WriteLine("Файл не существует.");
            }
        }
    }
}
