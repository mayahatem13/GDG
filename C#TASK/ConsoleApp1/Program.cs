Console.WriteLine("Enter First Number:");
int x = Convert.ToInt32(Console.ReadLine());
Console.WriteLine("Enter Second Number:");
int y = Convert.ToInt32(Console.ReadLine());
Console.WriteLine("Enter an operator:");
char op = Convert.ToChar(Console.ReadLine());
do{
    if (op == '+')
    {
        Console.WriteLine("The result is: " + (x + y));
    }
    else if (op == '-')
    {
        Console.WriteLine("The result is: " + (x - y));
    }
    else if (op == '*')
    {
        Console.WriteLine("The result is: " + (x * y));
    }
    else if (op == '/')
    {
        Console.WriteLine("The result is: " + (x / y));
    }
    else
    {
        Console.WriteLine("Invalid Operator");
    }
    Console.WriteLine("Enter First Number:");
    x = Convert.ToInt32(Console.ReadLine());
    Console.WriteLine("Enter Second Number:");
    y = Convert.ToInt32(Console.ReadLine());
    Console.WriteLine("Enter an operator:");
    op = Convert.ToChar(Console.ReadLine());
} while (true);