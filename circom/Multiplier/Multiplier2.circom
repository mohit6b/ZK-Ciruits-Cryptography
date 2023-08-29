pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/
template Multiplier2 () {

  // Declaration of Signals
  signal input a;
  signal input b;
  signal output c;

  //Constraints
  c <== a*b;


// Creating instance of the above template
component main = Multiplier2();


// Compilation result will obtain programs to compute witness

// Compilation Command
// >> circom Multiplier2.circom --r1cs --wasm --sym --c

// --r1cs => generates file name Multiplier2.r1cs that contains R1CS constraint system of the circuit in binary format
// --wasm => generates the directory Multiplier2_js which contains wasm code Multiplier2.wasm and other files to generate witness
// --sym => generates a sym file required for debugging and printing constraint system in an annonated mode
// --c => creates a directory Multiplier2_cpp with file Multiplier2.cpp, Multiplier2.dat, main.cpp and make file to compile cpp files to generate witness
// --o => to store output of above command in specific directory
// after version 2.0.8 we can use -l to include circuits


// Computing the witness
// cd Multiplier2_cpp
// node generate_witness.js Multiplier2.wasm input.json witness.wtns

// Proof generation and verification using Zk-Snarks snarkjs awith Groth16 with multi party computation and trusted setup ceremony
// CRS (Common Reference String or common secret key) is geenrated through trusted setup ceremony in 2 phases
// Phase 1 gnerates power of tau and is independent of Constraints with the help of coordinators
// Phase 2 uses output of power of tau and constraint system

// Steps
// PHASE 1
// 1. New power of tau setup ceremony through snarkjs
// >>> snarkjs powersoftau new bn128 12 pot12_0000.ptau -verification

// 2. Contribute on the new powersoftau setup ceremony
// >>> snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First Contribution" -v

// PHASE 2
// 3. Prepare setup ceremony of Phase 2 using powersoftau (final preparation)
// >>> snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -verification

// 4. Generate .zkey (shared key between prover and verifier) file

