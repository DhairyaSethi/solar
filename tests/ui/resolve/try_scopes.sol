contract C {
    // https://github.com/paradigmxyz/solar/issues/196
    function g(bool x) public returns (uint a, uint b) {}
    function f(bool b) public {
        try this.g(b) returns (uint a, uint b) {
            a = 1;
            b = 2;
        } catch Error(string memory s) {
            revert(s);
        }
    }

    // https://github.com/paradigmxyz/solar/issues/217
    function h() public returns (uint, uint) {
        try this.h() {
        } catch Error(string memory x) {
            x;
        } catch (bytes memory x) {
            x;
        }
    }
}
