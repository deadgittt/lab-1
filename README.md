

# Тесты
--➤  stack test --fast --no-terminal         
lab1-0.1.0.0: unregistering (local file changes: lab1.cabal)
lab1> configure (lib + exe + test)
Configuring lab1-0.1.0.0...
lab1> build (lib + exe + test) with ghc-9.6.7
Preprocessing library for lab1-0.1.0.0..
Building library for lab1-0.1.0.0..
Preprocessing executable 'lab1' for lab1-0.1.0.0..
Building executable 'lab1' for lab1-0.1.0.0..
Preprocessing test suite 'all-tests' for lab1-0.1.0.0..
Building test suite 'all-tests' for lab1-0.1.0.0..
lab1> copy/register
Installing library in /home/Atmosphere/ITMO/7_FP/lab1/.stack-work/install/x86_64-linux/b7265b181a5dd7849be9a9634d3639770923163add728a9d7593a790be4a06eb/9.6.7/lib/x86_64-linux-ghc-9.6.7/lab1-0.1.0.0-Hh4SRHh7EcHA6vO1bib7ND
Installing executable lab1 in /home/Atmosphere/ITMO/7_FP/lab1/.stack-work/install/x86_64-linux/b7265b181a5dd7849be9a9634d3639770923163add728a9d7593a790be4a06eb/9.6.7/bin
Registering library for lab1-0.1.0.0..
lab1> test (suite: all-tests)

Cases: 7  Tried: 7  Errors: 0  Failures: 0
Cases: 5  Tried: 5  Errors: 0  Failures: 0
✅ All tests passed



lab1> Test suite all-tests passed
Completed 2 action(s).
