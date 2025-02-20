﻿using System;

namespace Common.DAL.Contract
{
    // The unit of work class serves one purpose: to make sure that when you use multiple repositories, they share a single database context.
    // That way, when a unit of work is complete you can call the SaveChanges method on that instance of the context and be assured that all related changes will be coordinated.
    public interface IUnitOfWork : IDisposable
    {
        void Commit();

        void Rollback();

        T GetRepository<T>();
    }
}
