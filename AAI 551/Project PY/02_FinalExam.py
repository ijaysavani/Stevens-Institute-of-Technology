#Jay Kalyanbhai Savani
#Cwid - 20009207
class C1:
    def __init__(self, who):
        self.name = who

    def computeSalary(self):
        return 50000


class C2(C1):
    def computeSalary(self):
        return 75000


class C3(C2):
    def __init__(self, value):
        self.value = value

    def __add__(self, other):
        return 2 * self.value + 2 * other.value


I1 = C1("Bob")
I2 = C2("Sue")
I3 = C3(15)
I4 = C3(5)

print(I1.name)
print(I2.name)
print(I1.computeSalary())
print(I2.computeSalary())
print(I3 + I4)