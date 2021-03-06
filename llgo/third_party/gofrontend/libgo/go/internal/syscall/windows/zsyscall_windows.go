// MACHINE GENERATED BY 'go generate' COMMAND; DO NOT EDIT

package windows

import "unsafe"
import "syscall"

var _ unsafe.Pointer

var (
	modiphlpapi = syscall.NewLazyDLL("iphlpapi.dll")
	modkernel32 = syscall.NewLazyDLL("kernel32.dll")

	procGetAdaptersAddresses = modiphlpapi.NewProc("GetAdaptersAddresses")
	procGetComputerNameExW   = modkernel32.NewProc("GetComputerNameExW")
	procMoveFileExW          = modkernel32.NewProc("MoveFileExW")
)

func GetAdaptersAddresses(family uint32, flags uint32, reserved uintptr, adapterAddresses *IpAdapterAddresses, sizeOfPointer *uint32) (errcode error) {
	r0, _, _ := syscall.Syscall6(procGetAdaptersAddresses.Addr(), 5, uintptr(family), uintptr(flags), uintptr(reserved), uintptr(unsafe.Pointer(adapterAddresses)), uintptr(unsafe.Pointer(sizeOfPointer)), 0)
	if r0 != 0 {
		errcode = syscall.Errno(r0)
	}
	return
}

func GetComputerNameEx(nameformat uint32, buf *uint16, n *uint32) (err error) {
	r1, _, e1 := syscall.Syscall(procGetComputerNameExW.Addr(), 3, uintptr(nameformat), uintptr(unsafe.Pointer(buf)), uintptr(unsafe.Pointer(n)))
	if r1 == 0 {
		if e1 != 0 {
			err = error(e1)
		} else {
			err = syscall.EINVAL
		}
	}
	return
}

func MoveFileEx(from *uint16, to *uint16, flags uint32) (err error) {
	r1, _, e1 := syscall.Syscall(procMoveFileExW.Addr(), 3, uintptr(unsafe.Pointer(from)), uintptr(unsafe.Pointer(to)), uintptr(flags))
	if r1 == 0 {
		if e1 != 0 {
			err = error(e1)
		} else {
			err = syscall.EINVAL
		}
	}
	return
}
