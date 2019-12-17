namespace java thrift.generated
# 添加python
namespace py py.thrift.generated

# 类型别名
typedef i16 short
typedef i32 int
typedef i64 long
typedef bool boolean
typedef string String

# 定义一个结构体，相当于Protocol Buffers中的message
struct Person {
    1: optional String name,
    2: optional int age;
    3: optional boolean married
}

# 定义一个异常
exception DataException {
    1: optional String message,
    2: optional String callStack,
    3: optional String date;  # thrift 不支持类似Java.util.Date，需要在业务层自己做装换
}

# 定义一个服务
service PersonService {
    Person getPersonByUserName(1: required String userName),

    void savePerson(1: required Person person) throws (1: DataException dataException)
}
