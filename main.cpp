#include <iostream>

#include <pybind11/embed.h>
#include <pybind11/pybind11.h>
#define FORCE_IMPORT_ARRAY
#include <xtensor-python/pytensor.hpp>

using std::cout;
using std::endl;
using xt::pytensor;
using pybind11::scoped_interpreter;


int main() {
	scoped_interpreter guard{};
	import_array();

	pytensor<double, 1> sample = xt::zeros<double>({3});
	sample += 5.0;
	cout << sample(1) << endl;
	return 0;
}
