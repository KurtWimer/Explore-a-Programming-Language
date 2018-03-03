import std.stdio;
import std.file;
import std.algorithm;

void quicksort(int[] array, int lo, int hi)
{
	if(lo < hi)
	{
                //Partitioning index
		auto pi = cast (int) pivotPartition(array, hi);

		quicksort(array, lo, pi - 1);
		quicksort(array, pi + 1, hi);
	}
}

void main(string[] args)
{
	//Import and read file into an array
	auto array = slurp!(int)("unsorted.txt", "%d");

	//Perform selectionsort
	quicksort(array, 0, cast (int) array.length - 1);
	writeln(array);

	return;
}
