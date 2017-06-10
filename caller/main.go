package main

import (
	"fmt"
	"os"
	"plugin"
)

func main() {
	pv, pow2, addsub := setup()

	calc(pv, pow2, addsub)
}

func setup() (plugin.Symbol, plugin.Symbol, plugin.Symbol) {
	// Load plugin(.so)
	p, err := plugin.Open("/go/bin/calc.so")
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(-1)
	}

	// Get symbol of variable from plugin
	pv, err := p.Lookup("Pv")
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(-1)
	}

	// Get symbol of func from plugin
	pow2, err := p.Lookup("Pow2")
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(-1)
	}

	// Get symbol of func from plugin
	addsub, err := p.Lookup("AddSub")
	if err != nil {
		fmt.Fprint(os.Stderr, err)
		os.Exit(-1)
	}

	return pv, pow2, addsub
}

func calc(pv, pow2, addsub plugin.Symbol) {
	// raise by power method
	*pv.(*int) = 3
	p2 := pow2.(func() int)()
	fmt.Printf("pow2: %d * %d = %d\n", *pv.(*int), *pv.(*int), p2)

	// addition and subtraction
	x, y := 5, 2
	add, sub := addsub.(func(int, int) (int, int))(x, y)
	fmt.Printf("[result:add] %d + %d = %d\n", x, y, add)
	fmt.Printf("[result:sub] %d - %d = %d\n", x, y, sub)
}
