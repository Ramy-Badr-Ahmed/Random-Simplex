subroutine randomSimplexMatrix(n, m, y)
    implicit none
    integer, intent(in) :: n, m
    real(kind=8), dimension(m, n) :: y
    real(kind=8), dimension(m, n) :: C, p, xi, S
    integer :: i, j

    call random_number(C)
    C = C + tiny(1.0)  ! Ensure no zero values for log transformation
    C = 1.0 - C         ! Transform to open interval (0,1]
    
    do i = 1, m
        do j = 1, n
            p(i,j) = -log(C(i,j))
        end do
    end do
    
    do i = 1, m
        S(i) = sum(p(i,:))
        y(i,:) = p(i,:) / S(i)
    end do
    
    ! Check each row sums to approximately 1
    do i = 1, m
        if (abs(sum(y(i,:)) - 1.0) > 1.0e-10) then
            write(*,*) 'Error: Rows do not sum to 1.'
            stop
        end if
    end do
    
end subroutine randomSimplexMatrix
