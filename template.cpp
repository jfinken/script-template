
#include <iostream>
#include <memory>

// g++ template.cpp -std=c++14 -o foo

class Employee {
   public:
    Employee(){}
    virtual ~Employee() {}
    int getId() {return id_;}
    void setId(const int id){id_=id;}
   
   private:
    int id_;
};

int main(int argc, char* argv[]) {
    for (int i = 0; i < argc; i++) {
        std::cout << argv[i] << std::endl;
    }

    if (argc != 2) {
        std::cerr << "Usage: "
                  << argv[0]
                  << " <some-path>" << std::endl;
        return 1;
    }
    const std::string inputFile = argv[1];

    // unique_ptr
    std::unique_ptr<Employee> emp_ = std::make_unique<Employee>();

    // shared_ptr
    std::shared_ptr<Employee> emp2_ = std::make_shared<Employee>();


    return 0;
}

