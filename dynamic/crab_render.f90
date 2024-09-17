subroutine render_crab(size, result)
    implicit none
    integer, intent(in) :: size
    character(len=size*size*size), intent(out) :: result

    integer :: i, j, k
    character(len = 1) :: crab_char
    crab_char = '🦀'

    do i = 1, size
        do j = 1, size
            do k = 1, size
                if (i == size/2 .and. j == size/2 .and. k == size/2) then
                    result(i + (j-1)*size + (k-1)*size*size) = crab_char
                else
                    result(i + (j-1)*size + (k-1)*size*size) = ' '
                end if
            end do
        end do
    end do
end subroutine render_crab