# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mogonzal <mogonzal@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/10 12:28:25 by mogonzal          #+#    #+#              #
#    Updated: 2022/05/20 20:44:49 by mogonzal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

HEADER = ft_printf.h

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

CC = gcc -c

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

%.o:%.c $(HEADER)
	$(CC) $(CFLAGS) -o $@ $<
	@ECHO "Compiling... $^"

all: $(NAME)

$(NAME):	$(OBJS) $(HEADER)
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
