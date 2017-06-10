// This is simple calculator plugin.
package main

import (
	"fmt"
)

// Pv is value of Pow2().
var Pv int

func init() {
	fmt.Println("plugin `calc.so` is being called!")
}

// Pow2 calculate Pv powered 2.
func Pow2() int {
	return Pv * Pv
}

// AddSub calculate x plus y, x minus y.
func AddSub(x, y int) (int, int) {
	return x + y, x - y
}
