program main
    use crab_renderer
    implicit none

    type(CrabRenderer) :: renderer
    integer :: size
    character(len=1), allocatable :: result(:)

    size = 5
    renderer%size = size
    renderer%render_mode = 'E'    ! Emoji mode ('E' for emoji, 'A' for ASCII)
    renderer%fill_char = '🦀'      ! Set the crab emoji character

    allocate(result(size*size*size))

    call render_crab(renderer, result)

    print *, '3D Crab:'
    call print_crab(size, result)

    deallocate(result)
end program main

subroutine print_crab(size, result)
    implicit none
    integer, intent(in) :: size
    character(len=1), dimension(size*size*size), intent(in) :: result
    integer :: i, j, k

    do k = 1, size
        print *, 'Layer ', k, ':'
        do j = 1, size
            do i = 1, size
                write(*, '(A)', advance='no') result((i-1) + (j-1)*size + (k-1)*size*size + 1)
            end do
            print *   
        end do
        print *   
    end do
end subroutine print_crab
