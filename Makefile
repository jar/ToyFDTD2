KOKKOS_PATH = $(HOME)/packages/kokkos
SRC = $(wildcard *.cpp)

default: build
	echo "Start Build"

CXX = g++
CXXFLAGS = -O3
LINK = ${CXX}
LINKFLAGS =  
EXE = $(SRC:.cpp=.host)
KOKKOS_DEVICES = "OpenMP"

DEPFLAGS = -M

OBJ = $(SRC:.cpp=.o)
LIB =

include $(KOKKOS_PATH)/Makefile.kokkos

build: $(EXE)

$(EXE): $(OBJ) $(KOKKOS_LINK_DEPENDS)
	$(LINK) $(KOKKOS_LDFLAGS) $(LINKFLAGS) $(EXTRA_PATH) $(OBJ) $(KOKKOS_LIBS) $(LIB) -o $(EXE)

clean: kokkos-clean 
	rm -f *.o *.host
	rm -rf *.bob *.viz

# Compilation rules

%.o:%.cpp $(KOKKOS_CPP_DEPENDS)
	$(CXX) $(KOKKOS_CPPFLAGS) $(KOKKOS_CXXFLAGS) $(CXXFLAGS) $(EXTRA_INC) -c $<
