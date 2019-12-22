NAME = uls

SRCD = src
INCD = inc
OBJD = obj
LBMXD = libmx

LMBX = libmx.a
INC = uls.h
SRC = mx_uls.c \
	mx_create_file.c \
	mx_delete_file.c \
	mx_get_full_path.c \
	mx_get_size.c \
	mx_new_file.c \
	mx_get_owner.c \
	mx_push_file.c \
	mx_sort_files.c \
	mx_sort_args.c \
	mx_check_flags.c \
	mx_isflag.c \
	mx_print_error.c \
	mx_get_end_flags.c \
	mx_get_mtime.c \
	mx_get_permissions.c \
	mx_get_links.c \
	mx_get_group.c \
	mx_get_block_size.c \
	mx_get_blocks_count.c \
	mx_get_attr_acl.c \
	mx_get_ctime.c \
	mx_get_atime.c \
	mx_get_stime.c \
	mx_get_inode.c \
	mx_check_args.c \
	mx_set_flags.c \
	mx_handle_files.c \
	mx_format_dir.c \
	mx_get_dirs_arg.c \
	mx_get_files_arg.c \
	mx_get_all_arg.c \
	mx_delete_files.c \
	mx_get_flag_bit.c \
	mx_set_total.c \
	mx_set_name.c \
	mx_print_files.c \
	mx_get_all_dir.c \
	mx_print_inside_dir.c \
	mx_print_total.c \
	mx_extend_total.c \
	mx_print_name.c \
	mx_print_nl.c \
	mx_extend_name.c \
	mx_index_last_char.c \
	mx_get_length_file.c \
	mx_print_long_format.c \
	mx_print_perms.c \
	mx_print_links.c \
	mx_print_owner.c \
	mx_print_group.c \
	mx_print_size.c \
	mx_print_time.c \
	mx_print_filename.c \

INCLUDE = -I $(LBMXD) \
	-I $(INCD) \

LBMXS = $(addprefix $(LBMXD)/, $(LMBX))
INCS = $(addprefix $(INCD)/, $(INC))
SRCS = $(addprefix $(SRCD)/, $(SRC))
OBJS = $(addprefix $(OBJD)/, $(SRC:%.c=%.o))
	
CFLAGS = -std=c99 -g $(addprefix -W, all extra error pedantic)

all: install clean

install: $(LBMXS) $(NAME)

$(LBMXS):
	@make -sC $(LBMXD) install

$(NAME): $(OBJS)
	@$(CC) $(CFLAGS) $(LBMXS) $(OBJS) -o $@

$(OBJD)/%.o: $(SRCD)/%.c $(INCS)
	@$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDE)

$(OBJS): | $(OBJD)

$(OBJD):
	@mkdir -p $@

uninstall: clean
	@make -sC $(LBMXD) $@
	@rm -rf $(NAME)	

clean:
	@make -sC $(LBMXD) $@
	@rm -rf $(OBJD)

reinstall: clean all
