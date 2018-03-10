import std.datetime.systime;
import std.datetime.stopwatch;
import std.stdio;
import std.file;

/**
*Purpose: Sorts a given array of any length using the selection sort algorithm
*Effeciency: O(n^2)
*Params: array = array to be sorted
*Return: Void
*/
void selectionsort(int [] array)
{
	for (int i = 0; i < array.length; ++i){
		int min = array[i];
		int min_loc = i;
		//Finds smallest value remaining
		for(int j = i+1; j < array.length; ++j){
			if (array[j] < min)
			{
				min_loc = j;
				min = array[j];
			}
		}
		//Checks if a smaller value has been found and swaps
		if(min_loc != i)
		{
			int temp = array[i];
			array[i] = array[min_loc];
			array[min_loc] = temp;
		}
	}
}

void main(string[] args)
{
	//Import and read file into an array
	auto array = slurp!(int)("unsorted.txt", "%d");

	//Time and perform selectionsort
	auto sw = StopWatch(AutoStart.yes);
	selectionsort(array);
	sw.stop();
	writeln("Time elapsed: ",sw.peek());
	writeln(array);
	return;
}
