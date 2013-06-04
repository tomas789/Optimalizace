#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <sstream>
#include <cstdlib>

int
main (int argc, char * argv[]) {
	std::vector<std::string> args(argv, argv + argc);
	
	if (args.size() != 3) {
		std::cerr << "no file" << std::endl;
		return 1;
	}

	std::ifstream in(args[1].c_str());
	if (!in.is_open()) {
		std::cerr << "open file" << std::endl;
		return 1;
	}

	std::ofstream out(args[2].c_str());
	if (!out.is_open()) {
		std::cerr << "open out file" << std::endl;
		return 1;
	}

	
	while (in) {
		std::vector<int> plodina(23, 0);
		std::string line;
		std::getline(in, line);
		if (line.empty()) continue;

		std::istringstream p(line);
		std::string parse, plus;

		while (true) {
			p >> parse;
			if (parse == "+") continue;
			if (parse == "<=") break;
			plodina[atol(parse.substr(7, std::string::npos).c_str()) - 1] = 1;
		}

		p >> plodina[22];

		for (std::vector<int>::iterator it = plodina.begin(); it != plodina.end(); ++it)
			out << *it << " ";

		out << std::endl;
	}

	in.close();
	out.close();
}
