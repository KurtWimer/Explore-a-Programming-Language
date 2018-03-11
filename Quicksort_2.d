import std.stdio;
import std.file;
import std.datetime.stopwatch;
import std.algorithm: filter;
import std.array: array;

/**
*Purpose: Sorts a given array of any length using the quick sort algorithm
*Effeciency: O(n log n)
*Params: arr = array to be sorted
*Return: int[]
*/
int[] quicksort(int[] arr)
{
	//Base case
	if(arr.length == 0)
		return [];
	
	//Filter elements < arr[0] and concatenate them in front of arr[0]
	//Filter elements >= arr[0] and concatenate them behind arr[0]
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
