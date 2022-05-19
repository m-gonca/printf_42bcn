# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mogonzal <mogonzal@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/10 12:28:25 by mogonzal          #+#    #+#              #
#    Updated: 2022/05/18 19:24:27 by mogonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRCS = 	ft_printf.c \
		ft_format.c \
		ft_printchar.c \
		ft_printstr.c \
		ft_printint.c \
		ft_printunint.c \
		ft_printptr.c \
		ft_printhexa.c \
		ft_printhexacaps.c

OBJS = $(SRCS:.c=.o)

CC = gcc

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

.c.o: ${CC} ${CFLAGS} -I ft_printf.h -c $< -o ${<:.c=.o}

all: $(NAME)

$(NAME):	$(OBJS) ft_printf.h
		$(MAKE) -C ./libft all
		cp libft/libft.a $(NAME)
		ar -rcs $(NAME) $(OBJS)
		ranlib $(NAME)

clean: 
		$(RM) $(OBJS)
		$(MAKE) -C ./libft clean


fclean: clean
		$(RM) $(NAME)
		$(MAKE) -C ./libft fclean

re: fclean all

test: 
	$(CC) $(SRCS) -L. -lftprintf && ./a.out

.PHONY: all clean fclean re
