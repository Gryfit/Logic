//Church numerals

#include<iostream>
using namespace std;

template<class Type_arg, class Type_ret>
auto Church_numeral(Type_arg arg, Type_ret (*f)(Type_arg), int numeral)
{
	if (numeral == 0) {
		return arg;
	}
	return  Church_numeral(f(arg), f, numeral- 1);
}

int main() {

	float arg = 1;

	auto function = [](auto arg)->auto{return arg + 1; };

	for (int i = 0; i < 10; i++) {
		cout << Church_numeral<float,float>(arg, function, i);
	}
	char k;
	cin >> k;
	return 0;
}
