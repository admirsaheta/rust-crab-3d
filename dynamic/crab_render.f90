module crab_renderer
    implicit none
    private
    public :: CrabRenderer, render_crab

    type :: CrabRenderer
        character(len=1) :: render_mode     ! 'A' for ASCII, 'E' for Emoji
        character(len=1) :: fill_char       ! Fill character (e.g., '🦀' or '*')
        integer :: size                     ! Size of the cube
    end type CrabRenderer

contains

    subroutine render_crab(renderer, result)
        implicit none
        type(CrabRenderer), intent(in) :: renderer
        character(len=1), dimension(renderer%size * renderer%size * renderer%size), intent(out) :: result

        integer :: i, j, k
        character(len=1) :: crab_char

        select case (renderer%render_mode)
        case ('A')  
            crab_char = '*'
        case ('E')  
            crab_char = '🦀'
        case default
            crab_char = '?'  
        end select

        result = ' '

        do i = 1, renderer%size
            do j = 1, renderer%size
                do k = 1, renderer%size
                    if (i == (renderer%size+1)/2 .and. j == (renderer%size+1)/2 .and. k == (renderer%size+1)/2) then
                        result((i-1) + (j-1)*renderer%size + (k-1)*renderer%size*renderer%size + 1) = crab_char
                    end if
                end do
            end do
        end do
    end subroutine render_crab

end module crab_renderer
