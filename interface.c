unsigned long main(char *stream)
{
    unsigned long hash = 0;
    djb2_ccc(stream, &hash);
    return hash;
}