#include<iostream>
using namespace std;

template<class Type_arg, class Type_ret>
class church {	
private:
	Type_arg arg;
	Type_ret (*function)(Type_arg);
	int num;
public:	
	void set(Type_arg arg, Type_ret(*f)(Type_arg), int n)
	{
		this->arg = arg;
		this->num = n;
		this->function = f;
	}

	church(Type_arg, Type_ret(*f)(Type_arg), int);

	Type_ret get() {
		if (n == 0) {
			this->val = arg;
			return;
		}
		Type_ret val = f(arg);
		for (int i = n - 1; i > 0; i--) {
			val = f(temp);
		}
		return val;
	};

	church<Type_arg, Type_ret> operator+ (const church<Type_arg, Type_ret>  & ex) {
		if (this->arg == ex.arg && this->function == ex.function) {
			this->num = this->num + ex.num;
		}
		return *this;
	};

	church<Type_arg, Type_ret> operator- (const church<Type_arg, Type_ret>  & ex) {
		if (this->arg == ex.arg && this->function == ex.function) {
			if (this->num - ex.num > 0) {
				this->num = this->num - ex.num;
			}else{
				this->num = 0;
			}
		}
		return *this;
	};
	church<Type_arg, Type_ret> operator* (const church<Type_arg, Type_ret>  & ex) {
		if (this->arg == ex.arg && this->function == ex.function) {
			this->num = this->num * ex.num;
		}
		return *this;
	};

	church<Type_arg, Type_ret> operator% (const church<Type_arg, Type_ret>  & ex) {
		if (this->arg == ex.arg && this->function == ex.function) {
			this->num = this->num % ex.num;
		}
		return *this;
	};
	church<Type_arg, Type_ret> operator/ (const church<Type_arg, Type_ret>  & ex) {
		if (this->arg == ex.arg && this->function == ex.function) {
			this->num = (int) this->num / ex.num;
		}
		return *this;
	};
	church<Type_arg, Type_ret>& operator= (const church<Type_arg, Type_ret>  & ex) {
		if (this->arg == ex.arg && this->function == ex.function) {
			this->num = ex.num;
		}
		return *this;
	}

	church<Type_arg,Type_ret>& operator++() {
		this->num++;
		return *this;
	};
	church<Type_arg, Type_ret> operator++(int) {
		this->num++;
		return *this;
	};

	church<Type_arg, Type_ret> operator--() {
			if (this->num - 1 > 0) {
				this->num--;
			}
			else {
				this->num = 0;
			}
		return *this;
	};
	church<Type_arg, Type_ret> operator--(int) {
			if (this->num - 1 > 0) {
				this->num--;
			}
			else {
				this->num = 0;
			}
		return *this;
	};
	bool operator==(const church<Type_arg, Type_ret>& r) {
		if (this->arg == r.arg && this->function == r.function) {
			return this->num == r.num;
		}
		else {
			return false;
		}
	}
	bool operator!=(const church<Type_arg, Type_ret>& r) {
		return !(*this == r);
	}
	bool operator<(const church<Type_arg, Type_ret>& r) {
		if (this->arg == r.arg && this->function == r.function) {
			return 	this->get() < r.get();
		}
		else {
			return false;
		}
	}
	bool operator>(const church<Type_arg, Type_ret>& r) {
		if (this->arg == r.arg && this->function == r.function) {
			return 	this->get() > r.get();
		}
		else {
			return false;
		}
	}
};
template<class Type_arg, class Type_ret>
church<Type_arg, Type_ret>::church(Type_arg arg, Type_ret(*f)(Type_arg), int n)
{
	this->arg = arg;
	this->num = n;
	this->function = f;
}

int main() {

	float arg = 0;

	auto function = [](auto arg)->auto{return arg + 1; };
	church<float,float> c (arg, function, 0);
	church<float, float> d (arg, function, 3);
	if (c > d) {}
	else { cout << "NIE"; }
	char k;
	cin >> k;
	return 0;
}
