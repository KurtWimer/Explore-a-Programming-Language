import std.stdio;
import std.file;
import std.datetime.stopwatch;
import std.algorithm: filter;
import std.array: array;

int[] quicksort(int[] arr)
{
	if(arr.length == 0)
		return [];
	return quicksort(arr.filter!(a => a < arr[0]).array) 
		~ arr[0] ~ quicksort(arr[1..$].filter!(a => a >= arr[0]).array); 
}

void main(string[] args)
{
	//Import and read file into an array
	auto array = slurp!(int)("unsorted.txt", "%d");
	
	//Perform quicksort and time how long it will take
	auto sw = StopWatch(AutoStart.yes);
	array = quicksort(array);
	sw.stop();
	writeln(array);
	writeln("Time elapsed: ",sw.peek());
	return;
}
