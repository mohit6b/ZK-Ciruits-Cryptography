pragma circom 2.0.0;

template RangeProof() {
    signal private input x;       // Secret number
    signal private input lower;   // Lower bound
    signal private input upper;   // Upper bound
    
    signal private input bitLength = 8;  // Number of bits for x
    signal private input numBits = 8;    // Number of bits for bounds

    signal private input xBits[numBits];
    signal private input lowerBits[numBits];
    signal private input upperBits[numBits];

    for i in [0..numBits-1] {
        xBits[i] = x % 2;
        x = x / 2;
        lowerBits[i] = lower % 2;
        lower = lower / 2;
        upperBits[i] = upper % 2;
        upper = upper / 2;
    }

    signal temp = 1;

    for i in [0..numBits-1] {
        temp = temp * (xBits[i] * (2 * xBits[i] - 1) + 1);
    }

    for i in [0..numBits-1] {
        temp = temp * (lowerBits[i] * (2 * lowerBits[i] - 1) + 1);
        temp = temp * (upperBits[i] * (2 * upperBits[i] - 1) + 1);
    }

    signal output valid = (temp == 1);
}

component main = RangeProof();
