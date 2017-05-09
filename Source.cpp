#include<iostream>
using namespace std;


auto toi = [](auto arg) { 
	return arg +1; };


//DEFINED NUMS:
auto ZERO = [=](auto arg, auto f) { return arg; };
auto ONE = [=](auto arg, auto f) { return f(arg); };
auto TWO = [=](auto arg, auto f) { return f(ONE(arg,f)); };
auto THREE = [=](auto arg, auto f) { return f(TWO(arg,f)); };
auto FOUR = [=](auto arg, auto f) { return f(THREE(arg,f)); };
auto FIVE = [=](auto arg, auto f) { return f(FOUR(arg,f)); };
auto SIX = [=](auto arg, auto f) { return f(FIVE(arg,f)); };
auto SEVEN = [=](auto arg, auto f) { return f(SIX(arg,f)); };
auto EIGHT = [=](auto arg, auto f) { return f(SEVEN(arg,f)); };
auto NINE = [=](auto arg, auto f) { return f(EIGHT(arg,f)); };
auto TEN = [=](auto arg, auto f) { return f(NINE(arg,f)); };
//ARITHMETICS:
auto INC = [](auto arg, auto n, auto f) {return f(n(arg,f)); };
auto ADD = [](auto arg, auto a, auto b,auto f) {return a(INC(arg, b, f)); };
auto MUL = [](auto arg, auto n ,auto m, auto f) {return n(m(f(arg))); };
//BOOL:
auto TRUE = [](auto p, auto q) {return p; };
auto FALSE = [](auto p, auto q) {return q; };
auto IF = [](auto p) {return p; };


int main() {
	int a = 0;









	char k;
	cin >> k;
}