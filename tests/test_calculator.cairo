%lang starknet

from src.calculator import set_Sum, set_Div, set_Sub, set_Mul
from starkware.cairo.common.cairo_builtins import HashBuiltin

// External function prefixed with test_
@external
func test_set_Sum{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (resSum) = set_Sum(5, 10);
    assert resSum = 15;
    return ();
}

@external
func test_set_Sub{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (resSub) = set_Sub(10, 5);
    assert resSub = 5;
    return ();
}

@external
func test_set_Mul{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (resMult) = set_Mul(10, 5);
    assert resMult = 50;
    return ();
}

@external
func test_set_Div{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (resDiv) = set_Div(10, 5);
    assert resDiv = 2;
    return ();
}
