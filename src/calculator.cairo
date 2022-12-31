%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import deploy

@storage_var
func sum() -> (resSum: felt) {
}

@storage_var
func subtraction() -> (resSub: felt) {
}

@storage_var
func multiplication() -> (resMult: felt) {
}

@storage_var
func division() -> (resDiv: felt) {
}

@external
func set_Sum{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    numOne: felt, numTwo: felt
) -> (resSum: felt) {
    let result = numOne + numTwo;
    sum.write(result);
    return (resSum=result);
}

@external
func set_Sub{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    numOne: felt, numTwo: felt
) -> (resSub: felt) {
    let result = numOne - numTwo;
    subtraction.write(result);
    return (resSub=result);
}

@external
func set_Mul{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    numOne: felt, numTwo: felt
) -> (resMult: felt) {
    let result = numOne * numTwo;
    multiplication.write(result);
    return (resMult=result);
}

// division is over a field element
@external
func set_Div{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    numOne: felt, numTwo: felt
) -> (resDiv: felt) {
    let result = numOne / numTwo;
    division.write(result);
    return (resDiv=result);
}

@view
func get_Sum{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = sum.read();
    return (res=res);
}

@view
func get_Sub{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = subtraction.read();
    return (res=res);
}

@view
func get_Mul{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = multiplication.read();
    return (res=res);
}

@view
func get_Div{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (res: felt) {
    let (res) = division.read();
    return (res=res);
}
